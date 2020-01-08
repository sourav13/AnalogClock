//
//  ClockView.swift
//  Clocks
//
//  Created by sourav sachdeva on 01/12/19.
//  Copyright © 2019 sourav sachdeva. All rights reserved.
//

import UIKit

@IBDesignable
class ClockView: UIView {
    var clockDials : [ClockDailView] = []
    let date = ClockDate()
    var currentPos : CGFloat = 0
    var timer: Timer?
    var dial =  CAShapeLayer()
    var pointer =  CAShapeLayer()

    override  func awakeFromNib() {
        super.awakeFromNib()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimeLabel), userInfo: nil, repeats: true)
        setup()
        createObjectsAroundCircle()
        currentPos = calculatePointerPosition()
    }
    @objc func updateTimeLabel(){
        
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        let hour = Calendar.current.component(.hour, from: date.currentTime)
       
        //print(formatter.string(from: date.currentTime as Date))
    }
    func currentTime(){
//        let date = Date()
//        let calendar = Calendar.current
//        let hour = calendar.component(.hour, from: date)
//        let minutes = calendar.component(.minute, from: date)
//        let seconds  = calendar.component(.second, from: date)
       
      
    }
   required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
      // currentTime()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }

    func loadViewFromNib(){
       let ClockDailView : ClockDailView = UIView.fromNib()
       self.frame = ClockDailView.bounds
       self.autoresizingMask = [
           UIView.AutoresizingMask.flexibleWidth,
           UIView.AutoresizingMask.flexibleHeight
        ]
        addSubview(ClockDailView)
        
    }
    func createLabel()->UILabel
    {
    return UILabel()
    
    }
    func setup(){
        layer.addSublayer(dial)
        layer.addSublayer(pointer)
        dial.strokeColor = UIColor.black.cgColor
    }
    func calculatePointerPosition()-> CGFloat{
        let center = CGPoint(x: self.bounds.width/2 ,y: self.bounds.height/2)
        let radius : CGFloat = 200
        var angle = CGFloat(Double.pi * 2 + Double.pi * 1.5)
        let step =  CGFloat(Double.pi * 2) / CGFloat(11)
//        let x = cos(step) * radius + center.x
//        let y = sin(step) * radius + center.y
       return step
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        let path = buildArrow(width: 10, length: bounds.midX-20, depth: 20)
        pointer.path = path.cgPath
        pointer.strokeColor = UIColor.darkGray.cgColor
        pointer.position = CGPoint(x:bounds.midX,y:bounds.midY)
        pointer.lineWidth = 4
        pointer.lineCap = CAShapeLayerLineCap.round
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.duration = 10
        animation.fromValue = -currentPos
        animation.toValue = 0
        //animation.repeatCount = .greatestFiniteMagnitude
        pointer.add(animation,forKey: "time")
        
    }
    func buildArrow(width:CGFloat,length:CGFloat,depth:CGFloat)->UIBezierPath{
        let path = UIBezierPath()
        path.move(to: .zero)
        let endPoint = CGPoint(x:0,y:-length)
        path.addLine(to: endPoint)
        path.move(to:CGPoint(x:0-width,y:endPoint.y+depth))
        path.addLine(to:endPoint)
        path.move(to: CGPoint(x:width,y:endPoint.y+depth))
        path.addLine(to:endPoint)
        return path
    }
    
    
    override  func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
       createObjectsAroundCircle()
    }
    func createObjectsAroundCircle() {

       let center = CGPoint(x: self.bounds.width/2 ,y: self.bounds.height/2)
       let radius : CGFloat = 200
       let count = 12

       var angle = CGFloat(Double.pi * 2 + Double.pi * 1.5)
       let step = CGFloat(Double.pi * 2) / CGFloat(count)

       let circlePath = UIBezierPath(arcCenter: center, radius: radius, startAngle: CGFloat(0), endAngle:CGFloat(Double.pi * 2), clockwise: true)
       //CGFloat(Double.pi *  2 - (Double.pi / 2))
       //CGFloat(Double.pi *  2 - (Double.pi / 2) + (4 * Double.pi/2))
       let shapeLayer = CAShapeLayer()
       shapeLayer.path = circlePath.cgPath

       shapeLayer.fillColor = UIColor.clear.cgColor
      // shapeLayer.strokeColor = UIColor.red.cgColor
       shapeLayer.lineWidth = 3.0

       self.layer.addSublayer(shapeLayer)

       for  index in 0..<count{
             let x = cos(angle) * radius + center.x
             let y = sin(angle) * radius + center.y
        let ClockDailView :ClockDailView = UIView.fromNib()
        let label =  ClockDailView.ClockHour
           if index == 0 {
                label?.text = "12"
           }else{
             label?.text = "\(index)"
           }
             label?.font = UIFont(name: "Arial", size: 20)
      //       label?.textColor = UIColor.black
             label?.sizeToFit()
        ClockDailView.frame.origin.x = x - (ClockDailView.frame.midX  )
        ClockDailView.frame.origin.y = y - (ClockDailView.frame.midY  )

        self.addSubview(ClockDailView)
             angle += step
         }
     }
    
    deinit {
        if let timer = self.timer {
            timer.invalidate()
        }
    }
    
}

extension UIView {
    class func fromNib<T: UIView>() -> T {
        return Bundle(for: T.self).loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
}
class ClockDate {
    
    var currentTime: Date {
        return Date()
    }
    
}
