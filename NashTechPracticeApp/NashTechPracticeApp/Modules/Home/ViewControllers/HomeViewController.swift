//
//  HomeViewController.swift
//  NashTechPracticeApp
//
//  Created by Software Engineer on 9/12/18.
//  Copyright © 2018 Software Engineer. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {

    // MARK: IBOutlets
    
    // MARK: Properties
    
    // MARK: System Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        Log("didReceiveMemoryWarning")
    }
    
    // MARK: Other Methods
    fileprivate func setupViews() {
        self.title = LocalizedString("home.title")
    }
    
    static func storyboardInstance() -> HomeViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateInitialViewController() as! HomeViewController
    }

}
