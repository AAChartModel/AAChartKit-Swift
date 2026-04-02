//
//  AABaseListVC.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2024/3/14.
//  Copyright © 2024 An An. All rights reserved.
//

import UIKit
import SwiftUI

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

    private var listViewController: AASectionedListViewController?
    private let selectionProxyTableView = UITableView(frame: .zero, style: .plain)

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "AAInfographics"
        view.backgroundColor = .systemBackground
    }

    public func setUpMainTableView() {
        listViewController?.willMove(toParent: nil)
        listViewController?.view.removeFromSuperview()
        listViewController?.removeFromParent()

        let childViewController = AASectionedListViewController(
            sections: makeSectionData(),
            configuration: makeSectionedListConfiguration()
        ) { [weak self] selection in
            guard let self else {
                return
            }

            let indexPath = IndexPath(row: selection.itemIndex, section: selection.sectionIndex)
            tableView(selectionProxyTableView, didSelectRowAt: indexPath)
        }

        addChild(childViewController)
        childViewController.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(childViewController.view)
        NSLayoutConstraint.activate([
            childViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            childViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            childViewController.view.topAnchor.constraint(equalTo: view.topAnchor),
            childViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        childViewController.didMove(toParent: self)
        listViewController = childViewController
    }

    open func makeSectionedListConfiguration() -> AASectionedListConfiguration {
        AASectionedListConfiguration()
    }

    private func colorWithHexString(_ hexString: String) -> Color {
        var colorString = hexString.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if colorString.hasPrefix("#") {
            colorString = String(colorString.dropFirst())
        }

        guard colorString.count == 6 else {
            return .gray
        }

        let redString = String(colorString.prefix(2))
        let greenString = String(colorString.dropFirst(2).prefix(2))
        let blueString = String(colorString.dropFirst(4).prefix(2))

        var red: UInt64 = 0
        var green: UInt64 = 0
        var blue: UInt64 = 0

        Scanner(string: redString).scanHexInt64(&red)
        Scanner(string: greenString).scanHexInt64(&green)
        Scanner(string: blueString).scanHexInt64(&blue)

        return Color(
            .sRGB,
            red: Double(red) / 255.0,
            green: Double(green) / 255.0,
            blue: Double(blue) / 255.0,
            opacity: 1.0
        )
    }

    private func makeSectionData() -> [AASectionedListSection] {
        guard !sectionTitleArr.isEmpty else {
            return []
        }

        return chartTypeTitleArr.enumerated().compactMap { sectionIndex, rowTitles in
            guard sectionTitleArr.indices.contains(sectionIndex) else {
                return nil
            }

            let colorHex = colorsArr.isEmpty ? "#5470c6" : colorsArr[sectionIndex % colorsArr.count]
            let accentColor = colorWithHexString(colorHex)
            let items = rowTitles.enumerated().map { rowIndex, rowTitle in
                AASectionedListItem(
                    id: AnyHashable(IndexPath(row: rowIndex, section: sectionIndex)),
                    title: rowTitle,
                    subtitle: "Chart Example #\(rowIndex + 1)",
                    badgeText: "\(rowIndex + 1)"
                )
            }

            return AASectionedListSection(
                id: AnyHashable(sectionIndex),
                title: sectionTitleArr[sectionIndex],
                accentColor: accentColor,
                items: items
            )
        }
    }

    open func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { }
}
