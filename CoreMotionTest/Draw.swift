//
//  Draw.swift
//  CoreMotionTest
//
//  Created by Prashuk Ajmera on 8/15/19.
//  Copyright © 2019 Prashuk Ajmera. All rights reserved.
//

import UIKit

class Draw: UIView {

    override func draw(_ rect: CGRect) {
        let aPath = UIBezierPath()
        
        aPath.move(to: CGPoint(x:20, y:50))
        
        aPath.addLine(to: CGPoint(x:300, y:50))
        
        //Keep using the method addLineToPoint until you get to the one where about to close the path
        
        aPath.close()
        
        //If you want to stroke it with a red color
        UIColor.red.set()
        aPath.stroke()
        //If you want to fill it as well
        aPath.fill()
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
