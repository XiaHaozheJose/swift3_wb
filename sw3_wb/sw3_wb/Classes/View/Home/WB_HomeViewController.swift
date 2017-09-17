

//
//  WB_HomeViewController.swift
//  sw3_wb
//
//  Created by 浩哲 夏 on 2017/9/13.
//  Copyright © 2017年 浩哲 夏. All rights reserved.
//

import UIKit

fileprivate let cellId = "homeCellId"

class WB_HomeViewController: WB_BaseViewController {

    ///数据数组
    fileprivate lazy var statusList = [String]()
    
    ///加载假数据
    override func loadData() {
        for i in 0..<15{
            statusList.insert(i.description, at: 0)
        }
    }
    
    
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
        
        ///注册原型cell
        tableView?.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }
}


// MARK: - 数据源,具体的数据源方法,不需要super
extension WB_HomeViewController{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statusList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = statusList[indexPath.row]
        return cell
    }
}


