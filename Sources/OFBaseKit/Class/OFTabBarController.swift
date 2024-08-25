//
//  OFTabBarController.swift
//
//
//  Created by elonfreedom on 2024/8/22.
//

import UIKit

public protocol NavigationControllerProtocol: UINavigationController { }

open class OFTabBarController: UITabBarController {

    open override func viewDidLoad() {
        super.viewDidLoad()
    }

    open func setChildViewController(_ childController: UIViewController,
        title: String,
        imageName: String,
        selectedImageName: String,
        navigationControllerType: UINavigationController.Type = OFNavigationController.self) {
        let item = UITabBarItem.init(title: title, image: UIImage(systemName: imageName), selectedImage: UIImage(systemName: imageName))
        childController.tabBarItem = item
        let navVc = navigationControllerType.init(rootViewController: childController)
        addChild(navVc)
    }

    /// 预加载所有子视图控制器的 view
    open func preloadAllViewControllers() {
        guard let viewControllers = self.viewControllers else { return }
        for viewController in viewControllers {
            let _ = viewController.view
        }
    }

    open func setTabBar() {
        /// controller.view 背景色
        view.backgroundColor = .white
        /// TabBar中选中状态下的图标和文本颜色
        tabBar.tintColor = .systemBlue

        /// TabBar中未选中状态下的图标和文本颜色
        tabBar.unselectedItemTintColor = .gray
        /// UITabBar背景色
        tabBar.barTintColor = .white
        /// 是否具有透明度    默认半透明
        tabBar.isTranslucent = true
//        self.delegate = self
    }

    open func hiddenBarTopLine(to hidden: Bool) {
        let clearImage = hidden ? UIImage() : nil
        tabBar.backgroundImage = clearImage
        tabBar.shadowImage = clearImage
    }

}
