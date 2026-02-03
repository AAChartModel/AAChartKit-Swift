//
//  AppDelegate.swift
//  AAInfographicsDemo
//
//  Created by An An on 2017/6/8.
//  Copyright © 2017年 An An. All rights reserved.
//*************** ...... SOURCE CODE ...... ***************
//***...................................................***
//*** https://github.com/AAChartModel/AAChartKit        ***
//*** https://github.com/AAChartModel/AAChartKit-Swift  ***
//***...................................................***
//*************** ...... SOURCE CODE ...... ***************

/*
 
 * -------------------------------------------------------------------------------
 *
 *  🌕 🌖 🌗 🌘  ❀❀❀   WARM TIPS!!!   ❀❀❀ 🌑 🌒 🌓 🌔
 *
 * Please contact me on GitHub,if there are any problems encountered in use.
 * GitHub Issues : https://github.com/AAChartModel/AAChartKit-Swift/issues
 * -------------------------------------------------------------------------------
 * And if you want to contribute for this project, please contact me as well
 * GitHub        : https://github.com/AAChartModel
 * StackOverflow : https://stackoverflow.com/users/12302132/codeforu
 * JianShu       : https://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */

/*
若介意本地js代码体积(250KB左右,工程打包压缩后实际体积远小于此)过大，可换用加载网络js代码
<script src="https://img.hcharts.cn/highcharts/highcharts.js">
</script>
<script src="https://img.hcharts.cn/highcharts/highcharts-more.js">
</script>
<script src="https://img.hcharts.cn/highcharts/modules/funnel.js">
</script>
 */

import UIKit

@available(iOS 14.0, macCatalyst 14.0, *)
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // 创建 UIWindow 实例
        window = UIWindow(frame: UIScreen.main.bounds)

        let rootViewController: UIViewController
        #if targetEnvironment(macCatalyst)
        rootViewController = createSidebarSplitViewController()
        #else
        // 使用 createTabBarController 方法创建 UITabBarController
        let tabBarController = createTabBarController()
        
        // 自定义 TabBar 外观
        customizeTabBarAppearance(tabBarController)
        rootViewController = tabBarController
        #endif

        // 设置根视图控制器
        window?.rootViewController = rootViewController

        // 设置窗口可见
        window?.makeKeyAndVisible()
        return true
    }
    
    // 自定义 TabBar 外观
    func customizeTabBarAppearance(_ tabBarController: UITabBarController) {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        
        // 设置背景颜色和模糊效果
        appearance.backgroundColor = .systemBackground
        
        // 设置更明显的阴影效果
        appearance.shadowColor = UIColor.separator
        appearance.shadowImage = UIImage()
        
        // 自定义选中和未选中状态的颜色
        let normalAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.secondaryLabel,
            .font: UIFont.systemFont(ofSize: 10, weight: .medium)
        ]
        let selectedAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.systemBlue,
            .font: UIFont.systemFont(ofSize: 10, weight: .semibold)
        ]
        
        // 配置所有布局样式
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = normalAttributes
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = selectedAttributes
        appearance.stackedLayoutAppearance.normal.iconColor = .secondaryLabel
        appearance.stackedLayoutAppearance.selected.iconColor = .systemBlue
        
        appearance.inlineLayoutAppearance.normal.titleTextAttributes = normalAttributes
        appearance.inlineLayoutAppearance.selected.titleTextAttributes = selectedAttributes
        appearance.inlineLayoutAppearance.normal.iconColor = .secondaryLabel
        appearance.inlineLayoutAppearance.selected.iconColor = .systemBlue
        
        appearance.compactInlineLayoutAppearance.normal.titleTextAttributes = normalAttributes
        appearance.compactInlineLayoutAppearance.selected.titleTextAttributes = selectedAttributes
        appearance.compactInlineLayoutAppearance.normal.iconColor = .secondaryLabel
        appearance.compactInlineLayoutAppearance.selected.iconColor = .systemBlue
        
        tabBarController.tabBar.standardAppearance = appearance
        if #available(iOS 15.0, *) {
            tabBarController.tabBar.scrollEdgeAppearance = appearance
        }
        
        // 设置 TabBar 的色调
        tabBarController.tabBar.tintColor = .systemBlue
        tabBarController.tabBar.unselectedItemTintColor = .secondaryLabel
        
        // 添加轻微的弹性动画效果
        tabBarController.tabBar.isTranslucent = true
    }

    // 创建一个 UITabBarController
    func createTabBarController() -> UITabBarController {
        let tabBarController = UITabBarController()
        
        // 使用更简洁的方式创建所有视图控制器
        let viewControllers = [
            createNavigationController(with: createFirstViewController()),
            createNavigationController(with: createSecondViewController()),
            createNavigationController(with: createThirdViewController()),
            createNavigationController(with: createFourthViewController()),
            createNavigationController(with: createFifthViewController())
        ]
        
        tabBarController.viewControllers = viewControllers
        return tabBarController
    }

    #if targetEnvironment(macCatalyst)
    // 在 macOS (Mac Catalyst) 上使用左侧边栏替代底部 TabBar，更符合 macOS 交互习惯
    func createSidebarSplitViewController() -> UISplitViewController {
        let navigationControllersBySection: [CatalystSidebarSection: UINavigationController] = [
            .chartModels: createNavigationController(with: createFirstViewController()),
            .options: createNavigationController(with: createSecondViewController()),
            .jsOptions: createNavigationController(with: createThirdViewController()),
            .officialSamples: createNavigationController(with: createFourthViewController()),
            .advanced: createNavigationController(with: createFifthViewController())
        ]

        let sidebarViewController = CatalystSidebarViewController()
        sidebarViewController.title = "AAChartKit"

        let sidebarNavigationController = UINavigationController(rootViewController: sidebarViewController)
        customizeNavigationBar(sidebarNavigationController)

        if #available(iOS 14.0, macCatalyst 14.0, *) {
            let splitViewController = UISplitViewController(style: .doubleColumn)
            splitViewController.preferredDisplayMode = .oneBesideSecondary
            splitViewController.preferredPrimaryColumnWidthFraction = 0.20
            splitViewController.minimumPrimaryColumnWidth = 200
            splitViewController.maximumPrimaryColumnWidth = 240
            splitViewController.setViewController(sidebarNavigationController, for: .primary)

            sidebarViewController.onSelectSection = { [weak splitViewController] section in
                guard let splitViewController else { return }
                guard let navigationController = navigationControllersBySection[section] else { return }
                splitViewController.setViewController(navigationController, for: .secondary)
            }

            // 默认展示第一个栏目
            sidebarViewController.loadViewIfNeeded()
            sidebarViewController.setSelectedSection(.chartModels, animated: false, notify: true)

            return splitViewController
        } else {
            let splitViewController = UISplitViewController()
            splitViewController.preferredDisplayMode = .allVisible
            splitViewController.viewControllers = [
                sidebarNavigationController,
                navigationControllersBySection[.chartModels] ?? UINavigationController()
            ]

            sidebarViewController.onSelectSection = { [weak splitViewController] section in
                guard let splitViewController else { return }
                guard let navigationController = navigationControllersBySection[section] else { return }
                splitViewController.showDetailViewController(navigationController, sender: nil)
            }

            // 默认展示第一个栏目
            sidebarViewController.loadViewIfNeeded()
            sidebarViewController.setSelectedSection(.chartModels, animated: false, notify: true)

            return splitViewController
        }
    }
    #endif
    
    // 通用的导航控制器创建方法
    func createNavigationController(with viewController: UIViewController) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: viewController)
        customizeNavigationBar(navigationController)
        return navigationController
    }

    func createFirstViewController() -> AAChartModelListVC {
        // 创建第一个视图控制器
        let firstVC = AAChartModelListVC()
        firstVC.tabBarItem = UITabBarItem(
            title: "图表模型",
            image: UIImage(systemName: "chart.bar.fill"),
            tag: 0
        )
        return firstVC
    }
    


    func createSecondViewController() -> UIViewController {
        // 创建第二个视图控制器
        let secondVC = AAOptionsListVC()
        secondVC.tabBarItem = UITabBarItem(
            title: "配置选项",
            image: UIImage(systemName: "slider.horizontal.3"),
            tag: 1
        )
        return secondVC
    }

    func createThirdViewController() -> UIViewController {
        // 创建第三个视图控制器
        let thirdVC = AAOptionsWithJSListVC()
        thirdVC.tabBarItem = UITabBarItem(
            title: "JS 配置",
            image: UIImage(systemName: "chevron.left.forwardslash.chevron.right"),
            tag: 2
        )
        return thirdVC
    }

    func createFourthViewController() -> UIViewController {
        // 创建第四个视图控制器
        let fourthVC = OfficialSamplesListVC()
        fourthVC.tabBarItem = UITabBarItem(
            title: "官方示例",
            image: UIImage(systemName: "star.fill"),
            tag: 3
        )
        return fourthVC
    }

    func createFifthViewController() -> UIViewController {
        // 创建第五个视图控制器
        let fifthVC = AdvancedFeaturesListVC()
        fifthVC.tabBarItem = UITabBarItem(
            title: "高级功能",
            image: UIImage(systemName: "gearshape.fill"),
            tag: 4
        )
        return fifthVC
    }



    
    // 自定义导航栏外观
    func customizeNavigationBar(_ navigationController: UINavigationController) {
        // 标准外观 - 滚动时显示（有背景）
        let standardAppearance = UINavigationBarAppearance()
        standardAppearance.configureWithOpaqueBackground()
        standardAppearance.backgroundColor = .systemBackground
        standardAppearance.shadowColor = .separator
        standardAppearance.shadowImage = UIImage()
        
        // 自定义标题样式
        standardAppearance.titleTextAttributes = [
            .foregroundColor: UIColor.label,
            .font: UIFont.systemFont(ofSize: 17, weight: .semibold)
        ]
        standardAppearance.largeTitleTextAttributes = [
            .foregroundColor: UIColor.label,
            .font: UIFont.systemFont(ofSize: 34, weight: .bold)
        ]
        
        // 自定义按钮样式
        let buttonAppearance = UIBarButtonItemAppearance()
        buttonAppearance.normal.titleTextAttributes = [
            .foregroundColor: UIColor.systemBlue,
            .font: UIFont.systemFont(ofSize: 17, weight: .regular)
        ]
        standardAppearance.buttonAppearance = buttonAppearance
        standardAppearance.doneButtonAppearance = buttonAppearance
        
        // 滚动边缘外观 - 页面顶部时显示（透明）
        let scrollEdgeAppearance = UINavigationBarAppearance()
        scrollEdgeAppearance.configureWithTransparentBackground()
        
        // 保持标题样式一致
        scrollEdgeAppearance.titleTextAttributes = standardAppearance.titleTextAttributes
        scrollEdgeAppearance.largeTitleTextAttributes = standardAppearance.largeTitleTextAttributes
        scrollEdgeAppearance.buttonAppearance = buttonAppearance
        scrollEdgeAppearance.doneButtonAppearance = buttonAppearance
        
        // 应用外观配置
        navigationController.navigationBar.standardAppearance = standardAppearance
        navigationController.navigationBar.scrollEdgeAppearance = scrollEdgeAppearance
        navigationController.navigationBar.compactAppearance = standardAppearance
        if #available(iOS 15.0, *) {
            navigationController.navigationBar.compactScrollEdgeAppearance = scrollEdgeAppearance
        }
        
        navigationController.navigationBar.tintColor = .systemBlue
        #if targetEnvironment(macCatalyst)
        navigationController.navigationBar.prefersLargeTitles = false
        #else
        navigationController.navigationBar.prefersLargeTitles = true
        #endif
        navigationController.navigationBar.isTranslucent = true
    }


    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

#if targetEnvironment(macCatalyst)
private enum CatalystSidebarSection: Int, CaseIterable {
    case chartModels
    case options
    case jsOptions
    case officialSamples
    case advanced

    var title: String {
        switch self {
        case .chartModels: return "图表模型"
        case .options: return "配置选项"
        case .jsOptions: return "JS 配置"
        case .officialSamples: return "官方示例"
        case .advanced: return "高级功能"
        }
    }

    var systemImageName: String {
        switch self {
        case .chartModels: return "chart.bar.fill"
        case .options: return "slider.horizontal.3"
        case .jsOptions: return "chevron.left.forwardslash.chevron.right"
        case .officialSamples: return "star.fill"
        case .advanced: return "gearshape.fill"
        }
    }
}

private final class CatalystSidebarViewController: UITableViewController {
    var onSelectSection: ((CatalystSidebarSection) -> Void)?

    private let sections = CatalystSidebarSection.allCases
    private var selectedSection: CatalystSidebarSection?

    init() {
        super.init(style: .insetGrouped)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "SidebarCell")
        tableView.allowsMultipleSelection = false
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 44, bottom: 0, right: 0)
    }

    func setSelectedSection(_ section: CatalystSidebarSection, animated: Bool, notify: Bool) {
        selectedSection = section
        guard let index = sections.firstIndex(of: section) else { return }
        let indexPath = IndexPath(row: index, section: 0)
        tableView.selectRow(at: indexPath, animated: animated, scrollPosition: .none)
        if notify {
            onSelectSection?(section)
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sections.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = sections[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "SidebarCell", for: indexPath)
        cell.textLabel?.text = section.title
        cell.imageView?.image = UIImage(systemName: section.systemImageName)
        cell.imageView?.tintColor = .secondaryLabel
        cell.accessoryType = .none
        cell.backgroundColor = .clear

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let section = sections[indexPath.row]
        selectedSection = section
        onSelectSection?(section)
    }
}
#endif
