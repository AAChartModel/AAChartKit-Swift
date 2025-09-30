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
    
    //convert hex color string to UIColor
    private func kColorWithHexString(_ hexString: String) -> UIColor {
        var cString: String = hexString.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString = (cString as NSString).substring(from: 1)
        }

        if (cString.count != 6) {
            return UIColor.gray
        }

        let rString = (cString as NSString).substring(to: 2)
        let gString = ((cString as NSString).substring(from: 2) as NSString).substring(to: 2)
        let bString = ((cString as NSString).substring(from: 4) as NSString).substring(to: 2)

        var r: CUnsignedInt = 0, g: CUnsignedInt = 0, b: CUnsignedInt = 0
        Scanner(string: rString).scanHexInt32(&r)
        Scanner(string: gString).scanHexInt32(&g)
        Scanner(string: bString).scanHexInt32(&b)

        return UIColor(
            red: CGFloat(r) / 255.0,
            green: CGFloat(g) / 255.0,
            blue: CGFloat(b) / 255.0,
            alpha: 1
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
                color: Color(uiColor: kColorWithHexString(colorHex))
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

    let sections: [SectionData]
    let indexTitles: [String]
    let onSelect: (Int, Int) -> Void

    var body: some View {
        ScrollViewReader { proxy in
            ZStack(alignment: .trailing) {
                List {
                    ForEach(sections) { section in
                        Section(header: SectionHeader(title: section.title, color: section.color)) {
                            ForEach(section.rows.indices, id: \.self) { rowIndex in
                                RowView(
                                    number: rowIndex + 1,
                                    title: section.rows[rowIndex],
                                    accentColor: section.color
                                ) {
                                    onSelect(section.id, rowIndex)
                                }
                                .listRowBackground(Color(.systemBackground))
                            }
                        }
                        .id(section.id)
                    }
                }
                .listStyle(.plain)

                if !indexTitles.isEmpty {
                    SectionIndexView(indexTitles: indexTitles) { targetSection in
                        withAnimation {
                            proxy.scrollTo(targetSection, anchor: .top)
                        }
                    }
                    .padding(.trailing, 6)
                }
            }
        }
        .background(Color(.systemBackground))
    }
}

@available(iOS 13.0, macCatalyst 13.1, *)
private struct SectionHeader: View {
    let title: String
    let color: Color

    var body: some View {
        Text(title)
            .font(.system(size: 17, weight: .bold))
            .foregroundStyle(Color.white)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 8)
            .background(
                RoundedRectangle(cornerRadius: 6, style: .continuous)
                    .fill(color)
            )
    }
}

@available(iOS 13.0, macCatalyst 13.1, *)
private struct RowView: View {
    let number: Int
    let title: String
    let accentColor: Color
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 12) {
                Text("\(number)")
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundStyle(.white)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(
                        Capsule()
                            .fill(accentColor)
                    )

                Text(title)
                    .foregroundStyle(Color.primary)
                    .frame(maxWidth: .infinity, alignment: .leading)

                Image(systemName: "chevron.right")
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundStyle(Color.secondary)
            }
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
        .padding(.vertical, 6)
    }
}

@available(iOS 13.0, macCatalyst 13.1, *)
private struct SectionIndexView: View {
    let indexTitles: [String]
    let onTap: (Int) -> Void

    var body: some View {
        VStack(spacing: 4) {
            ForEach(indexTitles.indices, id: \.self) { index in
                Button(action: { onTap(index) }) {
                    Text(indexTitles[index])
                        .font(.system(size: 11, weight: .medium))
                        .foregroundStyle(Color.secondary)
                        .frame(width: 24, height: 16)
                }
                .buttonStyle(.plain)
            }
        }
        .padding(.vertical, 6)
        .background(.thinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
    }
}


