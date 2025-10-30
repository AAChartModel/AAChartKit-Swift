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

        // 使用 createTabBarController 方法创建 UITabBarController
        let tabBarController = createTabBarController()
        
        // 自定义 TabBar 外观
        customizeTabBarAppearance(tabBarController)

        // 将 UITabBarController 设置为根视图控制器
        window?.rootViewController = tabBarController

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
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .systemBackground
        
        // 设置分隔线颜色
        appearance.shadowColor = .separator
        appearance.shadowImage = UIImage()
        
        // 自定义标题样式
        appearance.titleTextAttributes = [
            .foregroundColor: UIColor.label,
            .font: UIFont.systemFont(ofSize: 17, weight: .semibold)
        ]
        appearance.largeTitleTextAttributes = [
            .foregroundColor: UIColor.label,
            .font: UIFont.systemFont(ofSize: 34, weight: .bold)
        ]
        
        // 自定义按钮样式
        let buttonAppearance = UIBarButtonItemAppearance()
        buttonAppearance.normal.titleTextAttributes = [
            .foregroundColor: UIColor.systemBlue,
            .font: UIFont.systemFont(ofSize: 17, weight: .regular)
        ]
        appearance.buttonAppearance = buttonAppearance
        appearance.doneButtonAppearance = buttonAppearance
        
        navigationController.navigationBar.standardAppearance = appearance
        navigationController.navigationBar.scrollEdgeAppearance = appearance
        navigationController.navigationBar.compactAppearance = appearance
        if #available(iOS 15.0, *) {
            navigationController.navigationBar.compactScrollEdgeAppearance = appearance
        }
        
        navigationController.navigationBar.tintColor = .systemBlue
        navigationController.navigationBar.prefersLargeTitles = true
        
        // 启用平滑过渡
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

