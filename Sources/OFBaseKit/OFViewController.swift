//
//  OFViewController.swift
//  
//
//  Created by elonfreedom on 2024/8/22.
//

import UIKit

public class OFViewController: UIViewController {

    public override func viewDidLoad() {
        super.viewDidLoad()
        setupNav()
        setupUI()
        initData()
        fetchData()
        setNotification()
    }

    public func setupNav() {
        navigationItem.title = navTitle()
    }

    public func navTitle() -> String {
        return "title"
    }

    public func setupUI() { }

    public func initData() { }

    public func fetchData() { }

    public func setNotification() { }
}

public extension UIResponder {
    func findViewController() -> UIViewController? {
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
