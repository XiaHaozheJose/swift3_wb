//
//  WB_MainViewController.swift
//  sw3_wb
//
//  Created by 浩哲 夏 on 2017/9/13.
//  Copyright © 2017年 浩哲 夏. All rights reserved.
//

import UIKit

class WB_MainViewController: UITabBarController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setChildController()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


extension WB_MainViewController{
    fileprivate func setChildController(){
        let arrayDict = [["clsName":"WB_HomeViewController","title":"首页","imageName":""]]
        
        var arrayM = [UIViewController]()
        
        for dict in arrayDict{
            arrayM.append(controller(dict: dict))
        }
        viewControllers = arrayM
    }
    
    fileprivate func controller(dict: [String: String])->UIViewController{
        guard let clsName = dict["clsName"], let title = dict["title"], let imageName = dict["imageName"],
            let cls = NSClassFromString(Bundle.main.namespace + "." + clsName) as? UIViewController.Type
            else {
            return UIViewController()
        }
        
        let vc = cls.init()
        
        vc.title = title;
        
        let nav = WB_NavigationViewController(rootViewController: vc)
        
        return nav
        
        
        
        
    }
}
