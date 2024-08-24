//
//  OFNavigationController.swift
//  
//
//  Created by elonfreedom on 2024/8/22.
//

import UIKit

public class OFNavigationController: UINavigationController, UIGestureRecognizerDelegate {

    public override func viewDidLoad() {
        super.viewDidLoad()
        self.interactivePopGestureRecognizer?.delegate = self
    }

    public override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return children.count > 1
    }

    public func hiddenBottomLine(to hidden: Bool) {
        let clearImage = hidden ? UIImage() : nil
        navigationBar.setBackgroundImage(clearImage, for: .default)
        navigationBar.shadowImage = clearImage
    }
}
