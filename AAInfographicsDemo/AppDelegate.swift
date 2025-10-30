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
        // Override point for customization after application launch.
        // 创建 UIWindow 实例
        window = UIWindow(frame: UIScreen.main.bounds)

        // 使用 createTabBarController 方法创建 UITabBarController
        let tabBarController = createTabBarController()

        // 将 UITabBarController 设置为根视图控制器
        window?.rootViewController = tabBarController

        // 设置窗口可见
        window?.makeKeyAndVisible()
        return true
    }

    //创建一个 UITabBarController
    func createTabBarController() -> UITabBarController {
        // 创建一个 UITabBarController
        let tabBarController = UITabBarController()

        // 创建一个数组来保存所有的视图控制器
        var viewControllers = [UINavigationController]()

        let firstVC = createFirstNavigationController()
        viewControllers.append(firstVC)

        let secondVC =  createSecondNavigationController()
        viewControllers.append(secondVC)

        let thirdVC = createThirdNavigationController()
        viewControllers.append(thirdVC)

        let fourthVC = createFourthNavigationController()
        viewControllers.append(fourthVC)

        let fifthVC = createFifthNavigationController()
        viewControllers.append(fifthVC)

        // 将数组赋值给 UITabBarController
        tabBarController.viewControllers = viewControllers

        // 返回 UITabBarController
        return tabBarController
    }

    func createFirstViewController() -> AAChartModelListVC {
        // 创建第一个视图控制器
        let firstVC = AAChartModelListVC()
        firstVC.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0)

        // 在这里添加第一个视图控制器的其他配置

        return firstVC
    }
    


    func createSecondViewController() -> UIViewController {
        // 创建第二个视图控制器
        let secondVC = AAOptionsListVC()
        secondVC.tabBarItem = UITabBarItem(tabBarSystemItem: .history, tag: 1)

        // 在这里添加第二个视图控制器的其他配置

        return secondVC
    }

    func createThirdViewController() -> UIViewController {
        // 创建第三个视图控制器
        let thirdVC = AAOptionsWithJSListVC()
        thirdVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 2)

        // 在这里添加第三个视图控制器的其他配置

        return thirdVC
    }

    func createFourthViewController() -> UIViewController {
        // 创建第四个视图控制器
        let fourthVC = OfficialSamplesListVC()
        fourthVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 3)

        // 在这里添加第四个视图控制器的其他配置

        return fourthVC
    }

    func createFifthViewController() -> UIViewController {
        // 创建第五个视图控制器
        let fifthVC = AdvancedFeaturesListVC()
        fifthVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 4)

        // 在这里添加第五个视图控制器的其他配置

        return fifthVC
    }


    // 创建导航控制器，并将第一个视图控制器设置为根视图控制器
    func createFirstNavigationController() -> UINavigationController {
        let firstViewController = createFirstViewController()
        let navigationController = UINavigationController(rootViewController: firstViewController)
        return navigationController
    }

    // 创建导航控制器，并将第二个视图控制器设置为根视图控制器
    func createSecondNavigationController() -> UINavigationController {
        let secondViewController = createSecondViewController()
        let navigationController = UINavigationController(rootViewController: secondViewController)
        return navigationController
    }

    // 创建导航控制器，并将第三个视图控制器设置为根视图控制器
    func createThirdNavigationController() -> UINavigationController {
        let thirdViewController = createThirdViewController()
        let navigationController = UINavigationController(rootViewController: thirdViewController)
        return navigationController
    }

    // 创建导航控制器，并将第四个视图控制器设置为根视图控制器
    func createFourthNavigationController() -> UINavigationController {
        let fourthViewController = createFourthViewController()
        let navigationController = UINavigationController(rootViewController: fourthViewController)
        return navigationController
    }

    // 创建导航控制器，并将第五个视图控制器设置为根视图控制器
    func createFifthNavigationController() -> UINavigationController {
        let fifthViewController = createFifthViewController()
        let navigationController = UINavigationController(rootViewController: fifthViewController)
        return navigationController
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

