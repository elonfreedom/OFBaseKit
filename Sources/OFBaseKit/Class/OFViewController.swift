//
//  OFViewController.swift
//
//
//  Created by elonfreedom on 2024/8/22.
//

import UIKit

open class OFViewController: UIViewController {

    open override func viewDidLoad() {
        super.viewDidLoad()
        setupNav()
        setupUI()
        initData()
        fetchData()
        setNotification()
    }

    open func setupNav() {
        navigationItem.title = navTitle()
    }

    open func navTitle() -> String {
        return "title"
    }

    open func setupUI() { }

    open func initData() { }

    open func fetchData() { }

    open func setNotification() { }
}

public extension UIResponder {
    public func findViewController() -> UIViewController? {
        var nextResponder: UIResponder? = self
        while nextResponder != nil {
            nextResponder = nextResponder?.next
            if let viewController = nextResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
}
