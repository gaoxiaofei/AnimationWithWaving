//
//  RootViewController.swift
//  AnimationWave
//
//  Created by 必有我师 on 2017/6/30.
//  Copyright © 2017年 gxf. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    var jumpBtn: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        jumpBtn = UIButton.init(frame: CGRect.init(x: 0, y: 300, width: 150, height: 40))
        jumpBtn?.center.x = self.view.center.x
        jumpBtn?.setTitle("AnimationDemo", for: .normal)
        jumpBtn?.addTarget(self, action: #selector(jumpOnClick), for: .touchUpInside)
        jumpBtn?.backgroundColor = .blue
        
        view.addSubview(jumpBtn!)
        
    }
    
    @objc private func jumpOnClick() {
        self.navigationController?.pushViewController(AnimationViewController(), animated: true)
    }
    
    

   

}
