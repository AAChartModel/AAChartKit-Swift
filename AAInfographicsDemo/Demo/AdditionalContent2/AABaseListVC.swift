//
//  AABaseListVC.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2024/3/14.
//  Copyright © 2024 An An. All rights reserved.
//

import UIKit
import AAInfographics

let kCustomTableViewCell = "CustomTableViewCell"

@available(iOS 10.0, macCatalyst 13.1, *)
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "AAInfographics"
        
//        sectionTitleArr = []
//        
//        chartTypeTitleArr = []
//        
//        chartTypeArr = []
        
        view.backgroundColor = .white
        
//        setUpMainTableView()
    }
    
    public func setUpMainTableView() {
        let tableView = UITableView()
        tableView.frame = view.bounds
        tableView.autoresizingMask = [.flexibleWidth , .flexibleHeight]
        tableView.delegate = self
        tableView.dataSource = self
        tableView.sectionHeaderHeight = 45
        tableView.sectionIndexColor = .red
        tableView.register(UINib.init(nibName: kCustomTableViewCell, bundle: Bundle.main), forCellReuseIdentifier: kCustomTableViewCell)
        view.addSubview(tableView)
    }
    
    private func kRGBColorFromHex(rgbValue: Int) -> UIColor {
        UIColor(red: ((CGFloat)((rgbValue & 0xFF0000) >> 16)) / 255.0,
                green: ((CGFloat)((rgbValue & 0xFF00) >> 8)) / 255.0,
                blue: ((CGFloat)(rgbValue & 0xFF)) / 255.0,
                alpha: 1.0)
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
}

@available(macCatalyst 13.1, *)
extension AABaseListVC: UITableViewDelegate, UITableViewDataSource {
    open func numberOfSections(in tableView: UITableView) -> Int {
        chartTypeTitleArr.count
    }
    
    open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        chartTypeTitleArr[section].count
    }
    
    open func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        var listTitles = [String]()
        for item: String in sectionTitleArr {
            let titleStr = item.prefix(1)
            listTitles.append(String(titleStr))
        }
        return listTitles
    }
    
    open func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionHeaderView = UIView()
        let bgColor = kColorWithHexString(colorsArr[section % 18])
        //设置圆角效果
        sectionHeaderView.layer.cornerRadius = 6
        sectionHeaderView.layer.masksToBounds = true
        sectionHeaderView.backgroundColor = bgColor
        
        let sectionTitleLabel = UILabel()
        sectionTitleLabel.frame = sectionHeaderView.bounds
        sectionTitleLabel.autoresizingMask = [.flexibleWidth , .flexibleHeight]
        sectionTitleLabel.text = sectionTitleArr[section]
        sectionTitleLabel.textColor = .white
        sectionTitleLabel.font = .boldSystemFont(ofSize: 17)
        sectionTitleLabel.textAlignment = .center
        sectionHeaderView.addSubview(sectionTitleLabel)
  
        
        return sectionHeaderView
    }
    
    open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kCustomTableViewCell) as! CustomTableViewCell
        cell.accessoryType = .disclosureIndicator
//        if indexPath.row % 2 == 0 {
//            cell.backgroundColor = .systemBackground
//        } else {
//            cell.contentView.backgroundColor = kRGBColorFromHex(rgbValue: 0xE6E6FA)// kRGBColorFromHex(rgbValue: 0xF5F5F5)//白烟
//        }
        
        let cellTitle = chartTypeTitleArr[indexPath.section][indexPath.row]
        cell.titleLabel?.text = cellTitle
//        cell.titleLabel.textColor = .black
        cell.numberLabel.text = String(indexPath.row + 1)
        let bgColor = kColorWithHexString(colorsArr[indexPath.section % 18])
        cell.numberLabel.backgroundColor = bgColor
        
        return cell
    }
    
    open func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { }
    
}

