

//
//  WB_HomeViewController.swift
//  sw3_wb
//
//  Created by 浩哲 夏 on 2017/9/13.
//  Copyright © 2017年 浩哲 夏. All rights reserved.
//

import UIKit

class WB_HomeViewController: WB_BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - 监听
    @objc fileprivate func addFriend(){
        
        let vc = WB_DemoViewController();
        navigationController?.pushViewController(vc, animated: true)
        
    }

}


// MARK: - UI
extension WB_HomeViewController{
    override func setUI(){
        super.setUI()
        
        //左侧NaviItem
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "好友", fontSize: 16, normalColor: UIColor.black, highlightColor: UIColor.orange, target: self, action: #selector(addFriend))
    }
}
