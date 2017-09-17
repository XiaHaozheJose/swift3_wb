//
//  JS_UIBarButton+Extension.swift
//  sw3_wb
//
//  Created by 浩哲 夏 on 2017/9/16.
//  Copyright © 2017年 浩哲 夏. All rights reserved.
//

import UIKit

class JS_UIBarButtonItem: UIBarButtonItem {
    
    convenience init(normalImage:UIImage,highlightImage:UIImage, target: Any?, action: Selector?,title:String) {
        self.init()
        let button = UIButton(imageName: normalImage, highImageName: highlightImage, title: title, bgImageName: nil, bgHighImage: nil)
        button.contentEdgeInsets = UIEdgeInsetsMake(0, -15, 0, 0)
        button.setTitleColor(UIColor.black, for: .normal)
        button.setTitleColor(UIColor.orange, for: .highlighted)
        button.addTarget(target, action: action!, for:.touchUpInside)
        button.sizeToFit()
        let view =  UIView.init(frame: button.frame)
        view.addSubview(button)
        self.customView = view
    }

}
