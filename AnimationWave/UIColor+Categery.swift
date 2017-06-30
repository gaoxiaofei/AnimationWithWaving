//
//  UIColor+Categery.swift
//  AnimationWave
//
//  Created by 必有我师 on 2017/6/30.
//  Copyright © 2017年 gxf. All rights reserved.
//

import UIKit

extension UIColor {

    //根据16进制的数值转换成相应的颜色
    class func colorWithRGBHex(hexColor: String) -> UIColor {
        var red:UInt32 = 0, green:UInt32 = 0, blue:UInt32 = 0
        if hexColor.contains("#") {
            Scanner(string: hexColor[1..<3]).scanHexInt32(&red)
            
            Scanner(string: hexColor[3..<5]).scanHexInt32(&green)
            
            Scanner(string: hexColor[5..<7]).scanHexInt32(&blue)
        }else{
            Scanner(string: hexColor[0..<2]).scanHexInt32(&red)
            
            Scanner(string: hexColor[2..<4]).scanHexInt32(&green)
            
            Scanner(string: hexColor[4..<6]).scanHexInt32(&blue)
        }
        
        
        return UIColor.init(colorLiteralRed: Float(red)/255.0, green: Float(green)/255.0, blue: Float(blue)/255.0, alpha: 1.0)
    }
    
    //背景色
    class func viewBlue_pub_Color() -> UIColor {
        return self.colorWithRGBHex(hexColor: "50D8C0")
    }
    
    
}

extension String {
    
    subscript (r: Range<Int>) -> String {
        get {
            let startIndex = self.index(self.startIndex, offsetBy: r.lowerBound)
            let endIndex = self.index(self.startIndex, offsetBy: r.upperBound)
            
            return self[startIndex..<endIndex]
        }
    }
}
