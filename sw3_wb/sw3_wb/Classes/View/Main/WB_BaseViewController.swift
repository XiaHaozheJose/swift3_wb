//
//  WB_BaseViewController.swift
//  sw3_wb
//
//  Created by 浩哲 夏 on 2017/9/13.
//  Copyright © 2017年 浩哲 夏. All rights reserved.
//

import UIKit

class WB_BaseViewController: UIViewController {

    // MARK: - 自定义控件
    
    var tableView : UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        // Do any additional setup after loading the view.
    }
    
    //加载数据, 具体实现有子类负责
    func loadData(){
        
    }
   

}

// MARK: - UI
extension WB_BaseViewController{
    func setUI(){
        view.backgroundColor = UIColor.randomColor()
        tableView = UITableView(frame: view.bounds,style:.plain)
        tableView?.delegate = self
        tableView?.dataSource = self
        view.addSubview(tableView!)
    }
}

extension WB_BaseViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
