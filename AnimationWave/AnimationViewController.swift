//
//  AnimationViewController.swift
//  AnimationWave
//
//  Created by 必有我师 on 2017/6/30.
//  Copyright © 2017年 gxf. All rights reserved.
//

import UIKit

class AnimationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        view.addSubview(self.backGroundView)
    }

    //背景
    private lazy var backGroundView:UIView = {
        let backImg:UIView = UIView.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 300))
        backImg.backgroundColor = UIColor.viewBlue_pub_Color()
        
        let waterView = BSWaterPattern.init(frame: CGRect(x: 0, y: backImg.frame.size.height - 30, width: UIScreen.main.bounds.width, height: 30))
        backImg.addSubview(waterView)
        
        return backImg
    }()
    
    

}
