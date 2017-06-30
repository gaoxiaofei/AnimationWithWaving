//
//  BSWaterPattern.swift
//  Biyouwoshi_swift
//
//  Created by BU54 on 2017/6/17.
//  Copyright © 2017年 LDC. All rights reserved.
//

import UIKit

class BSWaterPattern: UIView {
    
    let waterColor:UIColor = UIColor.white
    var waterAmplitude:CGFloat = 1
    var waterCycle:CGFloat = 1
    var increase:Bool = false
    let waterLineY:CGFloat = 20

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear

        /**
         CADisplayLink 定时器的刷新频率是和屏幕刷新率相同  每当屏幕需要刷新的时候，runloop就会调用CADisplayLink绑定的target上的selector
         **/
        var displayLink:CADisplayLink? = nil
        displayLink = CADisplayLink(target: self, selector: #selector(startRun))
        displayLink?.add(to: RunLoop.main, forMode: .commonModes)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func startRun() {
        if self.increase == true{
            self.waterAmplitude += 0.005;
        }else{
            self.waterAmplitude -= 0.005;
            
        }
        
        
        if (self.waterAmplitude<=0.8) {
            self.increase = true;
        }
        
        if (self.waterAmplitude>=1) {
            self.increase = false;
        }
        
        self.waterCycle+=0.02;
        
        self.setNeedsDisplay()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        //初始化画布
        let context:CGContext = UIGraphicsGetCurrentContext()!
    
        //定义前波浪path
        let frontPath:CGMutablePath  = CGMutablePath()
        
        //定义后波浪path
        let backPath:CGMutablePath = CGMutablePath()
        
        //画水
        context.setLineWidth(1)
        
        //前波浪位置初始化
        var frontY:CGFloat = self.waterLineY;
        frontPath.move(to: CGPoint(x: 0, y: frontY))
        
        //后波浪位置初始化
        var backY:CGFloat = self.waterLineY
        backPath.move(to: CGPoint(x: 0, y: backY))
        
        //绘制正弦/余弦曲线
        for x in 0...Int(UIScreen.main.bounds.width)  {
            
            let sin1:CGFloat = CGFloat(x)/180*CGFloat.pi + 4*self.waterCycle/CGFloat.pi
            frontY = self.waterAmplitude * sin(sin1) * 5 + self.waterLineY;
            frontPath.addLine(to: CGPoint(x:CGFloat(x),y:CGFloat(frontY)))
           
            let cos1:CGFloat =  CGFloat(x)/180*CGFloat.pi + CGFloat(3*self.waterCycle/CGFloat.pi)
            backY = self.waterAmplitude * cos(cos1) * 5 + self.waterLineY;
            backPath.addLine(to: CGPoint(x:CGFloat(x),y:CGFloat(backY)))
        }
        
        //后波浪绘制
        context.setFillColor(UIColor.init(red: 143/255, green: 236/255, blue: 219/255, alpha: 1).cgColor)
        backPath.addLine(to: CGPoint(x:UIScreen.main.bounds.width,y:rect.size.height))
        backPath.addLine(to: CGPoint(x:0,y:rect.size.height))
        backPath.addLine(to: CGPoint(x:0,y:self.waterLineY))
        backPath.closeSubpath();
        context.addPath(backPath);
        context.fillPath();
        context.saveGState();
        
        
        
        //前波浪绘制
        context.setFillColor(self.waterColor.cgColor);
        frontPath.addLine(to: CGPoint(x:UIScreen.main.bounds.width,y:rect.size.height))
        frontPath.addLine(to: CGPoint(x:0,y:rect.size.height))
        frontPath.addLine(to: CGPoint(x:0,y:self.waterLineY))
        frontPath.closeSubpath();
        context.addPath(frontPath);
        context.fillPath();
        context.saveGState();
        

    
    }

}
