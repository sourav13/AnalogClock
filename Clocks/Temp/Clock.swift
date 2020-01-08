//
//  Clock.swift
//  Clocks
//
//  Created by sourav sachdeva on 01/12/19.
//  Copyright © 2019 sourav sachdeva. All rights reserved.
//

import UIKit

@IBDesignable
class Clock: UIView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        createClock()
    }
    override  func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        createDigitals()
    }
    func createClock(){
//        layer.cornerRadius = self.bounds.width/2
//        layer.borderColor = UIColor.red.cgColor
//        layer.borderWidth = 10
        createDigitals()
    }

   private func createDigitals(){
        let shapeLayer = CAShapeLayer()
        self.layer.addSublayer(shapeLayer)
        let path = UIBezierPath()
        path.move(to: CGPoint( x: self.bounds.midX,y: 0))
    path.addCurve(to: CGPoint(x:self.bounds.midX+100 ,y:100 ), controlPoint1: CGPoint( x: self.bounds.midX,y: 0), controlPoint2: CGPoint(x:self.bounds.midX+50 ,y:50 ))
       path.addLine(to: CGPoint(x:self.bounds.midX+100 ,y:100 ))
            // path.addArc(withCenter: CGPoint(x: self.bounds.midX, y: self.bounds.midY), radius: self.bounds.width/2, startAngle: 0, endAngle: 45, clockwise: true)
//        print(self.bounds.width/2)
   //     let path = UIBezierPath(arcCenter: CGPoint(x: self.bounds.midX, y: self.bounds.midY), radius: self.bounds.width/2, startAngle: 0, endAngle: 22, clockwise: true)
//        print(shapeLayer.position)
//        print(shapeLayer.anchorPoint)
   //     shapeLayer.bounds = self.bounds
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = UIColor.yellow.cgColor
        shapeLayer.strokeColor = UIColor.black.cgColor
        shapeLayer.lineWidth = 6
    }
    private func buildClock(){
        let startAngle = 0.75 * CGFloat.pi
        let endAngle = 0.25 * CGFloat.pi
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
