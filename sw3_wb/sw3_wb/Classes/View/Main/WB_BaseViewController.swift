//
//  WB_BaseViewController.swift
//  sw3_wb
//
//  Created by 浩哲 夏 on 2017/9/13.
//  Copyright © 2017年 浩哲 夏. All rights reserved.
//

import UIKit

class WB_BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        // Do any additional setup after loading the view.
    }

   

}

// MARK: - UI
extension WB_BaseViewController{
    func setUI(){
        view.backgroundColor = UIColor.randomColor()
    }
}
