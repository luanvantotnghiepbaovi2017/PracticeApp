//
//  UIViewController.swift
//  NashTechPracticeApp
//
//  Created by Software Engineer on 9/12/18.
//  Copyright © 2018 Software Engineer. All rights reserved.
//

import UIKit

extension UIViewController {
    func getNavigationBarHeight() -> CGFloat {
        return self.navigationController?.navigationBar.frame.height ?? 0.0
    }
    func getTabbarHeight() -> CGFloat {
        return self.tabBarController?.tabBar.frame.height ?? 0.0
    }
    func getTopBarHeight() -> CGFloat {
        return getStatusBarHeight() + self.getNavigationBarHeight()
    }
}
