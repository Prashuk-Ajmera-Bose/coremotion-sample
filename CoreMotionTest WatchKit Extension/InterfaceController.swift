//
//  InterfaceController.swift
//  CoreMotionTest WatchKit Extension
//
//  Created by Prashuk Ajmera on 8/15/19.
//  Copyright © 2019 Prashuk Ajmera. All rights reserved.
//

import WatchKit
import Foundation
import CoreMotion


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var xMotion: WKInterfaceLabel!
    @IBOutlet weak var yMotion: WKInterfaceLabel!
    @IBOutlet weak var zMotion: WKInterfaceLabel!
    
    var motion = CMMotionManager()
    var timer: Timer!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        myDeviceMotion()
//        myAccelerometerMotion()
//        myGyroscopesMotion()
        
//        motion.startAccelerometerUpdates()
//        motion.startGyroUpdates()
//        motion.startMagnetometerUpdates()
//        motion.startDeviceMotionUpdates()
//
//
//        timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(update as () -> Void), userInfo: nil, repeats: true)
        
//        print(motion.isGyroAvailable)
//        print(motion.isGyroActive)
//        print(motion.isAccelerometerAvailable)
//        print(motion.isMagnetometerAvailable)
//        print(motion.isDeviceMotionAvailable)
//
//        if motion.isGyroAvailable {
//            self.motion.gyroUpdateInterval = 1.0 / 60.0
//            self.motion.startGyroUpdates()
//
//            self.timer = Timer(fire: Date(), interval: (1.0/60.0), repeats: true, block: { (timer) in
//                                print(self.motion.gyroData)
//            })
//
//            RunLoop.current.add(self.timer, forMode: .default)
//        }
        
        
        
        
    }
    
    @objc func update() {
        if let accelerometerData = motion.accelerometerData {
            print("Acc")
            print(accelerometerData)
        }
        if let gyroData = motion.gyroData {
            print("Gyro")
            print(gyroData)
        }
        if let magnetometerData = motion.magnetometerData {
            print("Mag")
            print(magnetometerData)
        }
        if let deviceMotion = motion.deviceMotion {
            print("D Mot")
            print(deviceMotion)
        }
    }
    
    override func willActivate() {
        super.willActivate()
    }
    
    override func didDeactivate() {
        super.didDeactivate()
    }
    
    func myDeviceMotion() {
        
        
        if motion.isDeviceMotionAvailable {
            self.motion.deviceMotionUpdateInterval = 1.0 / 60.0
            self.motion.showsDeviceMovementDisplay = true
            self.motion.startDeviceMotionUpdates(to: OperationQueue.current!) { (data, error) in
                print(data as Any)
                print()
                print()
            }
//            self.motion.startDeviceMotionUpdates(using: .xMagneticNorthZVertical)
//
//            // Configure a timer to fetch the motion data.
//            self.timer = Timer(fire: Date(), interval: (1.0 / 60.0), repeats: true,
//                               block: { (timer) in
//                                if let data = self.motion.deviceMotion {
//                                    // Get the attitude relative to the magnetic north reference frame.
//                                    print(data.attitude.pitch)
//                                    print(data.attitude.roll)
//                                    print(data.attitude.yaw)
//
//                                    print(data.heading)
//
//                                    // Use the motion data in your app.
//                                }
//            })
//
//            // Add the timer to the current run loop.
//            RunLoop.current.add(self.timer!, forMode: RunLoop.Mode.default)
        
        }
        
//        motion.deviceMotionUpdateInterval = 0.1
//        motion.startDeviceMotionUpdates(to: OperationQueue.current!) { (data, error) in
//            print("Device Motion")
//            print(data as Any)
//            if let trueData = data {
//                let mPitch = trueData.attitude.pitch
//                let mRoll = trueData.attitude.roll
//                let mYaw = trueData.attitude.yaw
//                self.xMotion.setText("P:" + String(mPitch.rounded(toPlaces: 3)) + ", R:" + String(mRoll.rounded(toPlaces: 3)) + ", Y:" + String(mYaw.rounded(toPlaces: 3)))
//            }
//            print()
//        }
    }
    
    func myAccelerometerMotion() {
        motion.accelerometerUpdateInterval = 0.1
        motion.startAccelerometerUpdates(to: OperationQueue.current!) { (data, error) in
            print("Accelerometer")
            print(data as Any)
            print()
        }
    }
    
    func myGyroscopesMotion() {
        motion.gyroUpdateInterval = 0.1
        print(motion.gyroData as Any)
        motion.startGyroUpdates(to: OperationQueue.current!) { (data, error) in
            print("Gyrospace")
            print(data as Any)
            print()
            if let truedata = data {
//                self.view.reloadInputViews()
                print(truedata.rotationRate.x)
            }
        }
    }

}

extension Double {
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
