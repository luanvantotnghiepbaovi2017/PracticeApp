//
//  BaseViewController.swift
//  NashTechPracticeApp
//
//  Created by Software Engineer on 9/12/18.
//  Copyright © 2018 iOS Dev. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    // MARK: Properties
    fileprivate var activityIndicatorView: SWActivityIndicatorView!
    fileprivate var blurView: UIView!
    
    // MARK: System Methods
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        Log("didReceiveMemoryWarning")
    }
    
    // MARK: Other Methods
    func showLoadingAdded(to view: UIView) {
        blurView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: view.frame.height))
        blurView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        view.addSubview(blurView)
        activityIndicatorView = SWActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        activityIndicatorView.color = UIColor().colorFromHex("#FCB711")
        activityIndicatorView.backgroundColor = .clear
        blurView.addSubview(self.activityIndicatorView)
        activityIndicatorView.center = blurView.center
        activityIndicatorView.startAnimating()
    }
    
    func hideLoading() {
        guard blurView != nil else { return }
        DispatchQueue.main.async {
            self.blurView.removeFromSuperview()
            self.activityIndicatorView.removeFromSuperview()
        }
    }

}
