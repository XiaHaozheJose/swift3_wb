//
//  WB_MainViewController.swift
//  sw3_wb
//
//  Created by 浩哲 夏 on 2017/9/13.
//  Copyright © 2017年 浩哲 夏. All rights reserved.
//

import UIKit

class WB_MainViewController: UITabBarController {

    // MARK: - 私有控件
    /// 撰写按钮
    lazy var composeButton: UIButton = {
        let button = UIButton();
        button.setImage(UIImage.init(named: "tabbar_compose_icon_add"), for: .normal)
        button.setBackgroundImage(UIImage.init(named: "tabbar_compose_button"), for: .normal)
        return button
    }()
    
    // MARK: - 生命周期
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setChildController()
        setComposeButton()
    }
    

    // MARK: - 监听方法
   @objc fileprivate  func composeStatus(){
        print("撰写文档")
    }
    
    

}


// MARK: - UI
extension WB_MainViewController{
    
    /// 子控制器
    fileprivate func setChildController(){
        let arrayDict = [
            ["clsName":"WB_HomeViewController","title":"首页","imageName":"home"],
            ["clsName":"WB_DiscoverViewController","title":"发现","imageName":"discover"],
            ["clsName":""],
            ["clsName":"WB_MessageViewController","title":"消息","imageName":"message"],
            ["clsName":"WB_ProfileViewController","title":"我的","imageName":"profile"]
        
        ]
        
        var arrayM = [UIViewController]()
        
        for dict in arrayDict{
            arrayM.append(controller(dict: dict))
        }
        viewControllers = arrayM
    }
    
    /// 创建控制器
    ///
    /// - Parameter dict: 控制器属性字典
    /// - Returns: 创建好的子控制器
    private func controller(dict: [String: String])->UIViewController{
        guard let clsName = dict["clsName"], let title = dict["title"], let imageName = dict["imageName"],
            let cls = NSClassFromString(Bundle.main.namespace + "." + clsName) as? UIViewController.Type
            else {
            return UIViewController()
        }
        
        let vc = cls.init()
        vc.title = title;
        
        //设置图片
        vc.tabBarItem.image = UIImage(named: "tabbar_" + imageName)
        vc.tabBarItem.selectedImage = UIImage(named: "tabbar_" + imageName + "_highlighted")?.withRenderingMode(.alwaysOriginal)
        
        
        //修改字体
        vc.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.orange], for:.selected)
        

        let nav = WB_NavigationViewController(rootViewController: vc)
        return nav
        
    }
    
    /// 中间撰写按钮
    fileprivate func setComposeButton(){
        tabBar.addSubview(composeButton)
        
        let width = tabBar.bounds.width / CGFloat(childViewControllers.count) - 1
        //正数向内缩进,负数向外扩展
        composeButton.frame = tabBar.bounds.insetBy(dx: 2 * width, dy: 0)
        composeButton.addTarget(self, action: #selector(composeStatus), for: .touchUpInside)
    }
    
}
