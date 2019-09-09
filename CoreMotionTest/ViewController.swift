//
//  ViewController.swift
//  CoreMotionTest
//
//  Created by Prashuk Ajmera on 8/15/19.
//  Copyright © 2019 Prashuk Ajmera. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

    var motion = CMMotionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myGyroscopesMotion()
    }
    
    func myGyroscopesMotion() {
        motion.gyroUpdateInterval = 0.1
        print(motion.gyroData as Any)
        motion.startGyroUpdates(to: OperationQueue.current!) { (data, error) in
            print("Gyrospace")
            print(data as Any)
            print()
            if let truedata = data {
                self.view.reloadInputViews()
                print(truedata.rotationRate.x)
            }
        }
    }


}

