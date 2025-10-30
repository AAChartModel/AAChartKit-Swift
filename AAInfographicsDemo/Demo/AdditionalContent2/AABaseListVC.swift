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

@available(iOS 14.0, macCatalyst 14.0, *)
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
        // 为每个 section 创建独立的索引项，包含 section ID
        let indexItems = sections.map { section in
            AABaseListView.IndexItem(
                displayText: section.indexTitle,
                targetSectionId: section.id
            )
        }

        let rootView = AABaseListView(
            sections: sections,
            indexItems: indexItems,
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

@available(iOS 14.0, macCatalyst 14.0, *)
private struct AABaseListView: View {
    struct SectionData: Identifiable {
        let id: Int
        let title: String
        let rows: [String]
        let color: Color
        var indexTitle: String { String(title.prefix(1)) }
    }
    
    struct IndexItem: Identifiable {
        let id = UUID()
        let displayText: String
        let targetSectionId: Int
    }

    @Environment(\.colorScheme) private var colorScheme

    let sections: [SectionData]
    let indexItems: [IndexItem]
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
        ZStack {
            if #available(iOS 14.0, macCatalyst 14.0, *) {
                ScrollableListContainer(
                    sections: sections,
                    indexItems: indexItems,
                    onSelect: onSelect,
                    cardBackgroundColor: cardBackgroundColor,
                    indexBackgroundColor: indexBackgroundColor
                )
            } else {
                // iOS 13 不支持 ScrollViewReader，只显示列表内容不带索引
                SectionListContent(
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
    let indexItems: [AABaseListView.IndexItem]
    let onSelect: (Int, Int) -> Void
    let cardBackgroundColor: Color
    let indexBackgroundColor: Color

    @State private var toastText: String? = nil
    @State private var isDraggingIndex = false

    var body: some View {
        ScrollViewReader { proxy in
            ZStack {
                HStack(spacing: 0) {
                    // 使用共享的内容组件
                    SectionListContent(
                        sections: sections,
                        onSelect: onSelect,
                        cardBackgroundColor: cardBackgroundColor
                    )
                    
                    if !indexItems.isEmpty {
                        SectionIndexView(
                            indexItems: indexItems,
                            backgroundColor: indexBackgroundColor,
                            onDraggingChanged: { dragging in
                                isDraggingIndex = dragging
                            }
                        ) { indexItem in
                            // 拖动时不使用动画，点击时使用动画
                            if isDraggingIndex {
                                // 快速滑动时，不使用动画直接跳转
                                proxy.scrollTo(indexItem.targetSectionId, anchor: .top)
                            } else {
                                // 点击时使用平滑动画
                                withAnimation(.easeInOut(duration: 0.4)) {
                                    proxy.scrollTo(indexItem.targetSectionId, anchor: .top)
                                }
                            }
                            
                            toastText = indexItem.displayText
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                                withAnimation {
                                    toastText = nil
                                }
                            }
                        }
                    }
                }
                
                if let text = toastText {
                    ToastView(text: text)
                        .transition(.opacity.combined(with: .scale(scale: 0.8)))
                        .zIndex(1)
                }
            }
        }
    }
}

// 通用的列表内容组件（iOS 13+ 都可用）
@available(iOS 14.0, macCatalyst 14.0, *)
private struct SectionListContent: View {
    let sections: [AABaseListView.SectionData]
    let onSelect: (Int, Int) -> Void
    let cardBackgroundColor: Color
    
    @Environment(\.colorScheme) private var colorScheme

    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0, pinnedViews: []) {
                ForEach(sections) { section in
                    VStack(alignment: .leading, spacing: 0) {
                        // Section Header
                        SectionHeader(title: section.title, color: section.color)
                            .padding(.top, 16)
                            .padding(.horizontal, 16)
                        
                        // Section Content
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
                        .padding(.horizontal, 16)
                        .padding(.top, 8)
                        .padding(.bottom, 8)
                    }
                    .id(section.id)
                }
                
                // 底部安全空间
                Color.clear
                    .frame(height: 60)
            }
            .padding(.bottom, 20)
        }
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

@available(iOS 14.0, macCatalyst 14.0, *)
private struct SectionIndexView: View {
    let indexItems: [AABaseListView.IndexItem]
    let backgroundColor: Color
    let onDraggingChanged: (Bool) -> Void  // 新增：拖动状态回调
    let onTap: (AABaseListView.IndexItem) -> Void
    
    @Environment(\.colorScheme) private var colorScheme
    @State private var selectedIndex: Int? = nil
    @State private var isDragging = false
    @State private var dragStartLocation: CGPoint?
    @State private var hasMoved = false  // 是否有实际移动
    
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
    
    // 根据触摸位置计算索引
    private func indexAtLocation(_ location: CGPoint, in geometry: GeometryProxy) -> Int? {
        let totalHeight = geometry.size.height
        let itemSpacing: CGFloat = 4
        let verticalPadding: CGFloat = 8
        let itemHeight: CGFloat = 22
        
        // 计算有效内容区域
        let contentHeight = totalHeight - (verticalPadding * 2)
        let totalItemsHeight = CGFloat(indexItems.count) * itemHeight + CGFloat(indexItems.count - 1) * itemSpacing
        
        // 计算起始偏移
        let startOffset = verticalPadding + max(0, (contentHeight - totalItemsHeight) / 2)
        
        // 调整后的 Y 位置
        let adjustedY = location.y - startOffset
        
        // 计算索引
        let singleItemHeight = itemHeight + itemSpacing
        let index = Int(adjustedY / singleItemHeight)
        
        // 确保索引在有效范围内
        if index >= 0 && index < indexItems.count {
            return index
        }
        return nil
    }
    
    // 触发索引选择
    private func selectIndex(_ index: Int) {
        guard index >= 0 && index < indexItems.count else { return }
        
        // 添加触觉反馈（轻触感）
        #if !targetEnvironment(macCatalyst)
        let impactFeedback = UIImpactFeedbackGenerator(style: .light)
        impactFeedback.impactOccurred()
        #endif
        
        withAnimation(.easeInOut(duration: 0.15)) {
            selectedIndex = index
        }
        
        onTap(indexItems[index])
    }

    var body: some View {
        VStack(spacing: 4) {
            ForEach(indexItems.indices, id: \.self) { index in
                Text(indexItems[index].displayText)
                    .font(.system(size: 11, weight: .bold, design: .rounded))
                    .foregroundColor(
                        selectedIndex == index ? .white : indexTextColor
                    )
                    .frame(width: 28, height: 22)
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
            // 使用 overlay 中的 GeometryReader 来捕获手势，覆盖在内容之上
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
                                
                                // 检测是否真的在拖动（移动距离超过3pt）
                                if let startLoc = dragStartLocation {
                                    let distance = abs(value.location.y - startLoc.y)
                                    if distance > 3 && !hasMoved {
                                        hasMoved = true
                                        onDraggingChanged(true)  // 确认是拖动
                                    }
                                }
                                
                                if let index = indexAtLocation(value.location, in: geometry) {
                                    if selectedIndex != index {
                                        selectIndex(index)
                                    }
                                }
                            }
                            .onEnded { _ in
                                isDragging = false
                                dragStartLocation = nil
                                
                                // 根据是否真的拖动来决定通知
                                if hasMoved {
                                    onDraggingChanged(false)
                                }
                                hasMoved = false
                                
                                // 延迟清除选中状态
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

@available(iOS 13.0, macCatalyst 13.1, *)
private struct ToastView: View {
    let text: String
    
    @Environment(\.colorScheme) private var colorScheme

    var body: some View {
        Text(text)
            .font(.system(size: 56, weight: .bold, design: .rounded))
            .foregroundColor(.white)
            .padding(25)
            .background(
                Circle()
                    .fill(Color.black.opacity(0.6))
            )
            .shadow(
                color: colorScheme == .dark
                    ? Color.black.opacity(0.5)
                    : Color.black.opacity(0.2),
                radius: 12,
                x: 0,
                y: 4
            )
    }
}


