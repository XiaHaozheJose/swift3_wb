//
//  WB_NavigationViewController.swift
//  sw3_wb
//
//  Created by 浩哲 夏 on 2017/9/13.
//  Copyright © 2017年 浩哲 夏. All rights reserved.
//

import UIKit

class WB_NavigationViewController: UINavigationController,UIGestureRecognizerDelegate {

    override func loadView() {
        super.loadView()
        let naviBar = UINavigationBar.appearance()
        naviBar.setBackgroundImage(#imageLiteral(resourceName: "navigationbarBackgroundWhite"), for: .default)
        naviBar.titleTextAttributes = [NSFontAttributeName: UIFont.systemFont(ofSize: 20)]
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let pan = UIPanGestureRecognizer(target: interactivePopGestureRecognizer?.delegate, action: "handleNavigationTransition:")
        view.addGestureRecognizer(pan)
        pan.delegate = self
        self.interactivePopGestureRecognizer?.isEnabled = false
        self.interactivePopGestureRecognizer?.delegate = self;

    }

    // MARK: - 监听
   @objc fileprivate func popController(){
        popViewController(animated: true)
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        return childViewControllers.count > 1
    }
   

}

// MARK: - 重写
extension WB_NavigationViewController{
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        if childViewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
            if childViewControllers.count > 1 {
                viewController.navigationItem.leftBarButtonItem = JS_UIBarButtonItem(normalImage: #imageLiteral(resourceName: "navigationButtonReturn"), highlightImage: #imageLiteral(resourceName: "navigationButtonReturnClick"), target: self, action: #selector(popController), title: "返回")
            }else{
                viewController.navigationItem.leftBarButtonItem = JS_UIBarButtonItem(normalImage: #imageLiteral(resourceName: "navigationButtonReturn"), highlightImage: #imageLiteral(resourceName: "navigationButtonReturnClick"), target: self, action: #selector(popController), title: title ?? "返回")
            }
        }
        
        super.pushViewController(viewController, animated: true)
    }
}
