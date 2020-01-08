//
//  ViewController.swift
//  Clocks
//
//  Created by sourav sachdeva on 01/12/19.
//  Copyright © 2019 sourav sachdeva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var clock: ClockView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      //  createObjectsAroundCircle()

        // Do any additional setup after loading the view.
    }
//    func createObjectsAroundCircle() {
//
//        let center = CGPoint(x: self.clock.bounds.width/2 ,y: self.clock.bounds.height/2)
//       let radius : CGFloat = 200
//       let count = 12
//
//       var angle = CGFloat(Double.pi * 2 + Double.pi * 1.5)
//       let step = CGFloat(Double.pi * 2) / CGFloat(count)
//
//       let circlePath = UIBezierPath(arcCenter: center, radius: radius, startAngle: CGFloat(0), endAngle:CGFloat(Double.pi * 2), clockwise: true)
//       //CGFloat(Double.pi *  2 - (Double.pi / 2))
//       //CGFloat(Double.pi *  2 - (Double.pi / 2) + (4 * Double.pi/2))
//       let shapeLayer = CAShapeLayer()
//       shapeLayer.path = circlePath.cgPath
//
//       shapeLayer.fillColor = UIColor.clear.cgColor
//       shapeLayer.strokeColor = UIColor.red.cgColor
//       shapeLayer.lineWidth = 3.0
//
//        self.clock.layer.addSublayer(shapeLayer)
//
//       for  index in 0..<count{
//             let x = cos(angle) * radius + center.x
//             let y = sin(angle) * radius + center.y
//
//        let ClockDailView : ClockDailView = UIView.fromNib()
//           if index == 0 {
//                ClockDailView.ClockHour?.text = "12"
//           }else{
//            ClockDailView.ClockHour?.text = "\(index)"
//           }
//             ClockDailView.ClockHour?.font = UIFont(name: "Arial", size: 20)
//             ClockDailView.ClockHour?.textColor = UIColor.black
//             ClockDailView.ClockHour?.sizeToFit()
//        ClockDailView.ClockHour?.frame.origin.x = x - (ClockDailView.ClockHour?.frame.midX ?? 0)
//        ClockDailView.ClockHour?.frame.origin.y = y - (ClockDailView.ClockHour?.frame.midY ?? 0)
//
//        self.clock.addSubview(ClockDailView)
//             angle += step
//         }
//     }
    
    
    
    
}

