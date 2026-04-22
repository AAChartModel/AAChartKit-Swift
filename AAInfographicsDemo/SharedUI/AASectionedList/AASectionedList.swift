//
//  AASectionedList.swift
//  AAInfographicsDemo
//
//  Created by Codex on 2026/4/2.
//

import SwiftUI
import UIKit

@available(iOS 14.0, macCatalyst 14.0, *)
struct AASectionedListItem: Identifiable {
    let id: AnyHashable
    let title: String
    let subtitle: String?
    let badgeText: String?

    init(
        id: AnyHashable,
        title: String,
        subtitle: String? = nil,
        badgeText: String? = nil
    ) {
        self.id = id
        self.title = title
        self.subtitle = subtitle
        self.badgeText = badgeText
    }
}

@available(iOS 14.0, macCatalyst 14.0, *)
struct AASectionedListSection: Identifiable {
    let id: AnyHashable
    let title: String
    let indexTitle: String?
    let accentColor: Color
    let items: [AASectionedListItem]

    init(
        id: AnyHashable,
        title: String,
        indexTitle: String? = nil,
        accentColor: Color,
        items: [AASectionedListItem]
    ) {
        self.id = id
        self.title = title
        self.indexTitle = indexTitle
        self.accentColor = accentColor
        self.items = items
    }

    var resolvedIndexTitle: String {
        if let indexTitle, !indexTitle.isEmpty {
            return indexTitle
        }

        let trimmedTitle = title.trimmingCharacters(in: .whitespacesAndNewlines)
        guard let firstCharacter = trimmedTitle.first else {
            return "#"
        }

        return String(firstCharacter).uppercased()
    }
}

@available(iOS 14.0, macCatalyst 14.0, *)
struct AASectionedListConfiguration {
    let showsPinnedHeaders: Bool
    let showsSectionIndex: Bool
    let rowAccessorySystemImageName: String?

    init(
        showsPinnedHeaders: Bool = true,
        showsSectionIndex: Bool = true,
        rowAccessorySystemImageName: String? = "arrow.right.circle.fill"
    ) {
        self.showsPinnedHeaders = showsPinnedHeaders
        self.showsSectionIndex = showsSectionIndex
        self.rowAccessorySystemImageName = rowAccessorySystemImageName
    }
}

@available(iOS 14.0, macCatalyst 14.0, *)
struct AASectionedListSelection {
    let sectionIndex: Int
    let itemIndex: Int
    let section: AASectionedListSection
    let item: AASectionedListItem
}

@available(iOS 14.0, macCatalyst 14.0, *)
struct AASectionedListView: View {
    fileprivate struct IndexItem: Identifiable {
        let displayText: String
        let targetSectionId: AnyHashable
        let color: Color

        var id: AnyHashable { targetSectionId }
    }

    let sections: [AASectionedListSection]
    let configuration: AASectionedListConfiguration
    let onSelect: (AASectionedListSelection) -> Void

    @Environment(\.colorScheme) private var colorScheme
    @State private var toastItem: IndexItem?
    @State private var isDraggingIndex = false

    init(
        sections: [AASectionedListSection],
        configuration: AASectionedListConfiguration = AASectionedListConfiguration(),
        onSelect: @escaping (AASectionedListSelection) -> Void = { _ in }
    ) {
        self.sections = sections
        self.configuration = configuration
        self.onSelect = onSelect
    }

    private var indexItems: [IndexItem] {
        sections.compactMap { section in
            let displayText = section.resolvedIndexTitle
            guard !displayText.isEmpty else {
                return nil
            }

            return IndexItem(
                displayText: displayText,
                targetSectionId: section.id,
                color: section.accentColor
            )
        }
    }

    private var backgroundColor: LinearGradient {
        colorScheme == .dark
            ? LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 0.05, green: 0.05, blue: 0.08),
                    Color(red: 0.10, green: 0.10, blue: 0.15)
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            : LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 0.98, green: 0.98, blue: 1.0),
                    Color(red: 0.95, green: 0.95, blue: 0.98)
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
    }

    private var cardBackgroundColor: Color {
        colorScheme == .dark
            ? Color(red: 0.15, green: 0.15, blue: 0.18, opacity: 0.95)
            : Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.95)
    }

    private var indexBackgroundColor: Color {
        colorScheme == .dark
            ? Color(red: 0.20, green: 0.20, blue: 0.25, opacity: 0.85)
            : Color(red: 0.88, green: 0.88, blue: 0.92, opacity: 0.85)
    }

    private var pinnedHeaderBackgroundColor: Color {
        colorScheme == .dark
            ? Color(red: 0.08, green: 0.08, blue: 0.11, opacity: 0.96)
            : Color(red: 0.97, green: 0.97, blue: 0.99, opacity: 0.96)
    }

    var body: some View {
        ScrollViewReader { proxy in
            ZStack {
                backgroundColor
                    .ignoresSafeArea()

                HStack(spacing: 0) {
                    AASectionedListContent(
                        sections: sections,
                        configuration: configuration,
                        cardBackgroundColor: cardBackgroundColor,
                        pinnedHeaderBackgroundColor: pinnedHeaderBackgroundColor,
                        onSelect: { sectionIndex, itemIndex in
                            let section = sections[sectionIndex]
                            let item = section.items[itemIndex]
                            onSelect(
                                AASectionedListSelection(
                                    sectionIndex: sectionIndex,
                                    itemIndex: itemIndex,
                                    section: section,
                                    item: item
                                )
                            )
                        }
                    )

                    if configuration.showsSectionIndex && !indexItems.isEmpty {
                        AASectionedListIndexView(
                            indexItems: indexItems,
                            backgroundColor: indexBackgroundColor,
                            onDraggingChanged: { dragging in
                                isDraggingIndex = dragging
                            },
                            onSelect: { indexItem in
                                if isDraggingIndex {
                                    proxy.scrollTo(indexItem.targetSectionId, anchor: .top)
                                } else {
                                    withAnimation(.easeInOut(duration: 0.4)) {
                                        proxy.scrollTo(indexItem.targetSectionId, anchor: .top)
                                    }
                                }

                                toastItem = indexItem
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                                    withAnimation {
                                        toastItem = nil
                                    }
                                }
                            }
                        )
                        .padding(.trailing, 8)
                    }
                }

                if let toastItem {
                    AASectionedListToastView(text: toastItem.displayText, accentColor: toastItem.color)
                        .transition(.opacity.combined(with: .scale(scale: 0.8)))
                        .zIndex(1)
                }
            }
        }
    }
}

@available(iOS 14.0, macCatalyst 14.0, *)
private struct AASectionedListContent: View {
    let sections: [AASectionedListSection]
    let configuration: AASectionedListConfiguration
    let cardBackgroundColor: Color
    let pinnedHeaderBackgroundColor: Color
    let onSelect: (Int, Int) -> Void

    @Environment(\.colorScheme) private var colorScheme

    private var pinnedViews: PinnedScrollableViews {
        configuration.showsPinnedHeaders ? [.sectionHeaders] : []
    }

    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0, pinnedViews: pinnedViews) {
                ForEach(Array(sections.enumerated()), id: \.element.id) { sectionIndex, section in
                    Section {
                        VStack(spacing: 8) {
                            ForEach(Array(section.items.enumerated()), id: \.element.id) { itemIndex, item in
                                AASectionedListRow(
                                    item: item,
                                    accentColor: section.accentColor,
                                    accessorySystemImageName: configuration.rowAccessorySystemImageName,
                                    fallbackBadgeText: "\(itemIndex + 1)"
                                ) {
                                    onSelect(sectionIndex, itemIndex)
                                }
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 12)
                        .background(
                            RoundedRectangle(cornerRadius: 16, style: .continuous)
                                .fill(cardBackgroundColor)
                                .shadow(
                                    color: colorScheme == .dark
                                        ? Color.black.opacity(0.3)
                                        : Color.black.opacity(0.08),
                                    radius: 8,
                                    x: 0,
                                    y: 2
                                )
                        )
                        .padding(.horizontal, 16)
                        .padding(.top, 12)
                        .padding(.bottom, 8)
                    } header: {
                        AASectionedListHeader(title: section.title, color: section.accentColor)
                            .padding(.top, 16)
                            .padding(.horizontal, 16)
                            .padding(.bottom, 4)
                            .background(pinnedHeaderBackgroundColor)
                            .id(section.id)
                    }
                }

                Color.clear
                    .frame(height: 60)
            }
            .padding(.bottom, 20)
        }
    }
}

@available(iOS 14.0, macCatalyst 14.0, *)
private struct AASectionedListHeader: View {
    let title: String
    let color: Color

    @Environment(\.colorScheme) private var colorScheme

    private var backgroundGradient: LinearGradient {
        colorScheme == .dark
            ? LinearGradient(
                gradient: Gradient(colors: [
                    color.opacity(0.25),
                    color.opacity(0.1)
                ]),
                startPoint: .leading,
                endPoint: .trailing
            )
            : LinearGradient(
                gradient: Gradient(colors: [
                    color.opacity(0.12),
                    color.opacity(0.04)
                ]),
                startPoint: .leading,
                endPoint: .trailing
            )
    }

    private var borderColor: Color {
        colorScheme == .dark
            ? color.opacity(0.4)
            : color.opacity(0.25)
    }

    private var textColor: Color {
        colorScheme == .dark ? .white : .black
    }

    var body: some View {
        HStack(spacing: 12) {
            RoundedRectangle(cornerRadius: 4, style: .continuous)
                .fill(color)
                .frame(width: 4, height: 24)

            Text(title)
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .foregroundColor(textColor)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .background(
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .fill(backgroundGradient)
                .overlay(
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .stroke(borderColor, lineWidth: 1)
                )
        )
        .shadow(
            color: colorScheme == .dark
                ? color.opacity(0.3)
                : color.opacity(0.15),
            radius: colorScheme == .dark ? 6 : 4,
            x: 0,
            y: 2
        )
    }
}

@available(iOS 14.0, macCatalyst 14.0, *)
private struct AASectionedListRow: View {
    let item: AASectionedListItem
    let accentColor: Color
    let accessorySystemImageName: String?
    let fallbackBadgeText: String
    let action: () -> Void

    @Environment(\.colorScheme) private var colorScheme
    @State private var isPressed = false

    private var rowBackgroundColor: Color {
        colorScheme == .dark
            ? Color(red: 0.16, green: 0.16, blue: 0.18)
            : Color(red: 0.99, green: 0.99, blue: 1.0)
    }

    private var borderColor: Color {
        colorScheme == .dark
            ? accentColor.opacity(0.3)
            : accentColor.opacity(0.15)
    }

    private var primaryTextColor: Color {
        colorScheme == .dark ? .white : .black
    }

    private var secondaryTextColor: Color {
        colorScheme == .dark ? .gray : .secondary
    }

    private var shadowColor: Color {
        colorScheme == .dark
            ? Color.black.opacity(0.4)
            : Color.black.opacity(0.08)
    }

    private var resolvedBadgeText: String {
        if let badgeText = item.badgeText, !badgeText.isEmpty {
            return badgeText
        }

        return fallbackBadgeText
    }

    var body: some View {
        Button(action: action) {
            HStack(spacing: 16) {
                ZStack {
                    Circle()
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    accentColor,
                                    accentColor.opacity(colorScheme == .dark ? 0.8 : 0.7)
                                ]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 32, height: 32)
                        .shadow(
                            color: accentColor.opacity(colorScheme == .dark ? 0.4 : 0.25),
                            radius: colorScheme == .dark ? 6 : 4,
                            x: 0,
                            y: 2
                        )

                    Text(resolvedBadgeText)
                        .font(.system(size: 14, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                        .minimumScaleFactor(0.7)
                        .lineLimit(1)
                }

                VStack(alignment: .leading, spacing: item.subtitle == nil ? 0 : 3) {
                    Text(item.title)
                        .font(.system(size: 16, weight: .medium, design: .default))
                        .foregroundColor(primaryTextColor)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)

                    if let subtitle = item.subtitle, !subtitle.isEmpty {
                        Text(subtitle)
                            .font(.system(size: 13, weight: .regular, design: .default))
                            .foregroundColor(secondaryTextColor)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }

                if let accessorySystemImageName, !accessorySystemImageName.isEmpty {
                    Image(systemName: accessorySystemImageName)
                        .font(.system(size: 20, weight: .medium))
                        .foregroundColor(accentColor)
                        .opacity(colorScheme == .dark ? 0.9 : 0.8)
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .background(
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .fill(rowBackgroundColor)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12, style: .continuous)
                            .stroke(borderColor, lineWidth: 1)
                    )
                    .shadow(
                        color: shadowColor,
                        radius: colorScheme == .dark ? 8 : 6,
                        x: 0,
                        y: colorScheme == .dark ? 3 : 2
                    )
            )
            .scaleEffect(isPressed ? 0.98 : 1.0)
            .animation(.easeInOut(duration: 0.1), value: isPressed)
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
        .onLongPressGesture(
            minimumDuration: 0,
            maximumDistance: .infinity,
            pressing: { pressing in
                isPressed = pressing
            },
            perform: {}
        )
    }
}

@available(iOS 14.0, macCatalyst 14.0, *)
private struct AASectionedListIndexView: View {
    typealias IndexItem = AASectionedListView.IndexItem

    let indexItems: [IndexItem]
    let backgroundColor: Color
    let onDraggingChanged: (Bool) -> Void
    let onSelect: (IndexItem) -> Void

    @Environment(\.colorScheme) private var colorScheme
    @State private var selectedIndex: Int?
    @State private var isDragging = false
    @State private var dragStartLocation: CGPoint?
    @State private var hasMoved = false

    private var indexTextColor: Color {
        colorScheme == .dark
            ? Color(red: 0.8, green: 0.8, blue: 0.85)
            : Color(red: 0.4, green: 0.4, blue: 0.5)
    }

    private var shadowColor: Color {
        colorScheme == .dark
            ? Color.black.opacity(0.3)
            : Color.black.opacity(0.1)
    }

    private func selectedColor(for index: Int) -> Color {
        guard index >= 0 && index < indexItems.count else {
            return colorScheme == .dark ? Color.blue.opacity(0.8) : Color.blue
        }

        return indexItems[index].color
    }

    private func indexAtLocation(_ location: CGPoint, in geometry: GeometryProxy) -> Int? {
        let totalHeight = geometry.size.height
        let itemSpacing: CGFloat = 4
        let verticalPadding: CGFloat = 8
        let itemHeight: CGFloat = 22
        let contentHeight = totalHeight - (verticalPadding * 2)
        let totalItemsHeight = CGFloat(indexItems.count) * itemHeight
            + CGFloat(max(0, indexItems.count - 1)) * itemSpacing
        let startOffset = verticalPadding + max(0, (contentHeight - totalItemsHeight) / 2)
        let adjustedY = location.y - startOffset
        let singleItemHeight = itemHeight + itemSpacing
        let index = Int(adjustedY / singleItemHeight)

        guard index >= 0 && index < indexItems.count else {
            return nil
        }

        return index
    }

    private func selectIndex(_ index: Int) {
        guard index >= 0 && index < indexItems.count else {
            return
        }

        #if !targetEnvironment(macCatalyst)
        let impactFeedback = UIImpactFeedbackGenerator(style: .light)
        impactFeedback.impactOccurred()
        #endif

        withAnimation(.easeInOut(duration: 0.15)) {
            selectedIndex = index
        }

        onSelect(indexItems[index])
    }

    var body: some View {
        VStack(spacing: 4) {
            ForEach(indexItems.indices, id: \.self) { index in
                Text(indexItems[index].displayText)
                    .font(.system(size: 11, weight: .bold, design: .rounded))
                    .foregroundColor(selectedIndex == index ? .white : indexTextColor)
                    .frame(width: 28, height: 22)
                    .background(
                        Circle()
                            .fill(selectedIndex == index ? selectedColor(for: index) : .clear)
                            .scaleEffect(selectedIndex == index ? 1.0 : 0.8)
                            .animation(
                                .spring(response: 0.3, dampingFraction: 0.6),
                                value: selectedIndex == index
                            )
                    )
            }
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 4)
        .background(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .fill(backgroundColor)
                .shadow(
                    color: shadowColor,
                    radius: colorScheme == .dark ? 10 : 8,
                    x: 0,
                    y: colorScheme == .dark ? 3 : 2
                )
        )
        .overlay(
            GeometryReader { geometry in
                Color.clear
                    .contentShape(Rectangle())
                    .gesture(
                        DragGesture(minimumDistance: 0)
                            .onChanged { value in
                                if !isDragging {
                                    isDragging = true
                                    dragStartLocation = value.startLocation
                                    hasMoved = false
                                }

                                if let dragStartLocation {
                                    let distance = abs(value.location.y - dragStartLocation.y)
                                    if distance > 3 && !hasMoved {
                                        hasMoved = true
                                        onDraggingChanged(true)
                                    }
                                }

                                if let index = indexAtLocation(value.location, in: geometry),
                                   selectedIndex != index {
                                    selectIndex(index)
                                }
                            }
                            .onEnded { _ in
                                isDragging = false
                                dragStartLocation = nil

                                if hasMoved {
                                    onDraggingChanged(false)
                                }
                                hasMoved = false

                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                    withAnimation(.easeInOut(duration: 0.2)) {
                                        selectedIndex = nil
                                    }
                                }
                            }
                    )
            }
        )
    }
}

@available(iOS 14.0, macCatalyst 14.0, *)
private struct AASectionedListToastView: View {
    let text: String
    let accentColor: Color

    @Environment(\.colorScheme) private var colorScheme

    var body: some View {
        Text(text)
            .font(.system(size: 56, weight: .bold, design: .rounded))
            .foregroundColor(accentColor)
            .padding(25)
            .background(
                Circle()
                    .fill(
                        colorScheme == .dark
                            ? Color.black.opacity(0.75)
                            : Color.white.opacity(0.95)
                    )
            )
            .shadow(
                color: accentColor.opacity(0.3),
                radius: 20,
                x: 0,
                y: 4
            )
            .overlay(
                Circle()
                    .stroke(accentColor.opacity(0.3), lineWidth: 2)
            )
    }
}

@available(iOS 14.0, macCatalyst 14.0, *)
final class AASectionedListViewController: UIHostingController<AASectionedListView> {
    init(
        sections: [AASectionedListSection],
        configuration: AASectionedListConfiguration = AASectionedListConfiguration(),
        onSelect: @escaping (AASectionedListSelection) -> Void = { _ in }
    ) {
        super.init(rootView: AASectionedListView(
            sections: sections,
            configuration: configuration,
            onSelect: onSelect
        ))
    }

    @MainActor @objc required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
    }
}
