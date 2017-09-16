//
//  UIBarButtonItem+Extension.swift
//  sw3_wb
//
//  Created by 浩哲 夏 on 2017/9/15.
//  Copyright © 2017年 浩哲 夏. All rights reserved.
//

import UIKit

extension UIBarButtonItem{
    
    
    convenience init(title: String , fontSize :CGFloat , normalColor :UIColor , highlightColor :UIColor , target : Any? , action :Selector){
        let btn = UIButton()
        btn.setTitle(title, for: .normal)
        btn.setTitleColor(normalColor, for: .normal)
        btn.setTitleColor(highlightColor, for: .highlighted)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: fontSize)
        btn.sizeToFit()
        btn.addTarget(target, action: action, for: .touchUpInside)
        let itemView = UIView(frame: btn.bounds)
        itemView.addSubview(btn)
        
        self.init(customView:itemView)
    }
}
