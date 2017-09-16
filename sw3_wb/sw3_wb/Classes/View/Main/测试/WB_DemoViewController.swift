//
//  WB_DemoViewController.swift
//  sw3_wb
//
//  Created by 浩哲 夏 on 2017/9/15.
//  Copyright © 2017年 浩哲 夏. All rights reserved.
//

import UIKit

class WB_DemoViewController: WB_BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "第\((navigationController?.childViewControllers.count ?? 0) - 1)页"
        // Do any additional setup after loading the view.
    }
    
    
    
    // MARK: - 监听
    @objc fileprivate func nextPage(){
        
        let vc = WB_DemoViewController();
        navigationController?.pushViewController(vc, animated: true)
    }
    
}


// MARK: - UI
extension WB_DemoViewController{
    override func setUI(){
        super.setUI()
        
        //右侧naviItem
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "下一页", fontSize: 16, normalColor: UIColor.black, highlightColor: UIColor.orange, target: self, action: #selector(nextPage))
    }
}
