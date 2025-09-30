//
//  AABaseListVC.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2024/3/14.
//  Copyright © 2024 An An. All rights reserved.
//

import UIKit
import SwiftUI
import AAInfographics

let kCustomTableViewCell = "CustomTableViewCell"

@available(iOS 13.0, macCatalyst 13.1, *)
class AABaseListVC: UIViewController {
    public var sectionTitleArr = [String]()
    public var chartTypeTitleArr = [[String]]()
    public var chartTypeArr = [[Any]]()
    public var colorsArr = [
        "#5470c6",
        "#91cc75",
        "#fac858",
        "#ee6666",
        "#73c0de",
        "#3ba272",
        "#fc8452",
        "#9a60b4",
        "#ea7ccc",

        "#5470c6",
        "#91cc75",
        "#fac858",
        "#ee6666",
        "#73c0de",
        "#3ba272",
        "#fc8452",
        "#9a60b4",
        "#ea7ccc",
    ]
    
    private var hostingController: UIHostingController<AABaseListView>?
    private let selectionProxyTableView = UITableView(frame: .zero, style: .plain)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "AAInfographics"
        
//        sectionTitleArr = []
//        
//        chartTypeTitleArr = []
//        
//        chartTypeArr = []
        
        view.backgroundColor = .systemBackground
        
//        setUpMainTableView()
    }
    
    public func setUpMainTableView() {
        hostingController?.willMove(toParent: nil)
        hostingController?.view.removeFromSuperview()
        hostingController?.removeFromParent()

        let sections = makeSectionData()
        let indexTitles = sections.map { $0.indexTitle }

        let rootView = AABaseListView(
            sections: sections,
            indexTitles: indexTitles,
            onSelect: { [weak self] section, row in
                guard let self = self else { return }
                let indexPath = IndexPath(row: row, section: section)
                self.tableView(self.selectionProxyTableView, didSelectRowAt: indexPath)
            }
        )

        let host = UIHostingController(rootView: rootView)
        host.view.backgroundColor = .clear
        addChild(host)
        host.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(host.view)
        NSLayoutConstraint.activate([
            host.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            host.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            host.view.topAnchor.constraint(equalTo: view.topAnchor),
            host.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        host.didMove(toParent: self)
        hostingController = host
    }
    
    //convert hex color string to SwiftUI Color
    private func kColorWithHexString(_ hexString: String) -> Color {
        var cString: String = hexString.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString = (cString as NSString).substring(from: 1)
        }

        if (cString.count != 6) {
            return Color.gray
        }

        let rString = (cString as NSString).substring(to: 2)
        let gString = ((cString as NSString).substring(from: 2) as NSString).substring(to: 2)
        let bString = ((cString as NSString).substring(from: 4) as NSString).substring(to: 2)

        var r: UInt64 = 0, g: UInt64 = 0, b: UInt64 = 0
        Scanner(string: rString).scanHexInt64(&r)
        Scanner(string: gString).scanHexInt64(&g)
        Scanner(string: bString).scanHexInt64(&b)

        return Color(
            .sRGB,
            red: Double(r) / 255.0,
            green: Double(g) / 255.0,
            blue: Double(b) / 255.0,
            opacity: 1
        )
    }

    private func makeSectionData() -> [AABaseListView.SectionData] {
        guard !sectionTitleArr.isEmpty else { return [] }
        return chartTypeTitleArr.enumerated().compactMap { index, rows in
            guard sectionTitleArr.indices.contains(index) else { return nil }
            let colorHex = colorsArr.isEmpty ? "#5470c6" : colorsArr[index % colorsArr.count]
            return AABaseListView.SectionData(
                id: index,
                title: sectionTitleArr[index],
                rows: rows,
                color: kColorWithHexString(colorHex)
            )
        }
    }
    
    open func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { }
}

@available(iOS 13.0, macCatalyst 13.1, *)
private struct AABaseListView: View {
    struct SectionData: Identifiable {
        let id: Int
        let title: String
        let rows: [String]
        let color: Color
        var indexTitle: String { String(title.prefix(1)) }
    }

    @Environment(\.colorScheme) private var colorScheme

    let sections: [SectionData]
    let indexTitles: [String]
    let onSelect: (Int, Int) -> Void

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
            : Color(red: 1, green: 1, blue: 1, opacity: 0.95)
    }

    private var indexBackgroundColor: Color {
        colorScheme == .dark
            ? Color(red: 0.20, green: 0.20, blue: 0.25, opacity: 0.85)
            : Color(red: 0.88, green: 0.88, blue: 0.92, opacity: 0.85)
    }

    var body: some View {
        Group {
            if #available(iOS 14.0, macCatalyst 14.0, *) {
                ScrollableListContainer(
                    sections: sections,
                    indexTitles: indexTitles,
                    onSelect: onSelect,
                    cardBackgroundColor: cardBackgroundColor,
                    indexBackgroundColor: indexBackgroundColor
                )
            } else {
                LegacyListView(
                    sections: sections,
                    onSelect: onSelect,
                    cardBackgroundColor: cardBackgroundColor
                )
            }
        }
        .background(backgroundColor)
    }
}

@available(iOS 14.0, macCatalyst 14.0, *)
private struct ScrollableListContainer: View {
    let sections: [AABaseListView.SectionData]
    let indexTitles: [String]
    let onSelect: (Int, Int) -> Void
    let cardBackgroundColor: Color
    let indexBackgroundColor: Color

    var body: some View {
        ScrollViewReader { proxy in
            ZStack(alignment: .trailing) {
                SectionedList(
                    sections: sections,
                    onSelect: onSelect,
                    cardBackgroundColor: cardBackgroundColor
                )
                .listStyle(.plain)

                if !indexTitles.isEmpty {
                    SectionIndexView(
                        indexTitles: indexTitles,
                        backgroundColor: indexBackgroundColor
                    ) { targetSection in
                        withAnimation(.easeInOut(duration: 0.6)) {
                            proxy.scrollTo(targetSection, anchor: .top)
                        }
                    }
                    .padding(.trailing, 8)
                }
            }
        }
    }
}

@available(iOS 13.0, macCatalyst 13.1, *)
private struct LegacyListView: View {
    let sections: [AABaseListView.SectionData]
    let onSelect: (Int, Int) -> Void
    let cardBackgroundColor: Color

    var body: some View {
        SectionedList(
            sections: sections,
            onSelect: onSelect,
            cardBackgroundColor: cardBackgroundColor
        )
        .listStyle(.plain)
    }
}

@available(iOS 13.0, macCatalyst 13.1, *)
private struct SectionedList: View {
    let sections: [AABaseListView.SectionData]
    let onSelect: (Int, Int) -> Void
    let cardBackgroundColor: Color
    
    @Environment(\.colorScheme) private var colorScheme

    var body: some View {
        List {
            ForEach(sections) { section in
                Section(
                    header: SectionHeader(title: section.title, color: section.color)
                        .padding(.top, 16)
                ) {
                    VStack(spacing: 8) {
                        ForEach(section.rows.indices, id: \.self) { rowIndex in
                            RowView(
                                number: rowIndex + 1,
                                title: section.rows[rowIndex],
                                accentColor: section.color
                            ) {
                                onSelect(section.id, rowIndex)
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
                    .listRowInsets(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                    .listRowBackground(Color.clear)
                }
                .id(section.id)
            }
        }
        .listStyle(PlainListStyle())
    }
}

@available(iOS 13.0, macCatalyst 13.1, *)
private struct SectionHeader: View {
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
        colorScheme == .dark
            ? Color.white
            : Color.black
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

@available(iOS 13.0, macCatalyst 13.1, *)
private struct RowView: View {
    let number: Int
    let title: String
    let accentColor: Color
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
        colorScheme == .dark
            ? Color.white
            : Color.black
    }
    
    private var secondaryTextColor: Color {
        colorScheme == .dark
            ? Color.gray
            : Color.secondary
    }
    
    private var shadowColor: Color {
        colorScheme == .dark
            ? Color.black.opacity(0.4)
            : Color.black.opacity(0.08)
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
                    
                    Text("\(number)")
                        .font(.system(size: 14, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                }

                VStack(alignment: .leading, spacing: 3) {
                    Text(title)
                        .font(.system(size: 16, weight: .medium, design: .default))
                        .foregroundColor(primaryTextColor)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text("Chart Example #\(number)")
                        .font(.system(size: 13, weight: .regular, design: .default))
                        .foregroundColor(secondaryTextColor)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }

                Image(systemName: "arrow.right.circle.fill")
                    .font(.system(size: 20, weight: .medium))
                    .foregroundColor(accentColor)
                    .opacity(colorScheme == .dark ? 0.9 : 0.8)
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
        .onLongPressGesture(minimumDuration: 0, maximumDistance: .infinity, pressing: { pressing in
            isPressed = pressing
        }, perform: {})
    }
}

@available(iOS 13.0, macCatalyst 13.1, *)
private struct SectionIndexView: View {
    let indexTitles: [String]
    let backgroundColor: Color
    let onTap: (Int) -> Void
    
    @Environment(\.colorScheme) private var colorScheme
    @State private var selectedIndex: Int? = nil
    
    private var indexTextColor: Color {
        colorScheme == .dark
            ? Color(red: 0.8, green: 0.8, blue: 0.85)
            : Color(red: 0.4, green: 0.4, blue: 0.5)
    }
    
    private var selectedBackgroundColor: Color {
        colorScheme == .dark
            ? Color.blue.opacity(0.8)
            : Color.blue
    }
    
    private var shadowColor: Color {
        colorScheme == .dark
            ? Color.black.opacity(0.3)
            : Color.black.opacity(0.1)
    }

    var body: some View {
        VStack(spacing: 3) {
            ForEach(indexTitles.indices, id: \.self) { index in
                Button(action: { 
                    withAnimation(.easeInOut(duration: 0.2)) {
                        selectedIndex = index
                    }
                    onTap(index)
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            selectedIndex = nil
                        }
                    }
                }) {
                    Text(indexTitles[index])
                        .font(.system(size: 11, weight: .bold, design: .rounded))
                        .foregroundColor(
                            selectedIndex == index ? .white : indexTextColor
                        )
                        .frame(width: 28, height: 20)
                        .background(
                            Circle()
                                .fill(
                                    selectedIndex == index 
                                        ? selectedBackgroundColor
                                        : Color.clear
                                )
                                .scaleEffect(selectedIndex == index ? 1.0 : 0.8)
                                .animation(.spring(response: 0.3, dampingFraction: 0.6), value: selectedIndex == index)
                        )
                }
                .buttonStyle(.plain)
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
    }
}


