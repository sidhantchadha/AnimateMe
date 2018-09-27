//
//  ViewController.swift
//  Animation
//
//  Created by Sidhant Chadha on 8/22/18.
//  Copyright © 2018 AMoDynamics, Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var viewToAnimate : UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    
    @IBAction func beginAnimation(_ sender: Any) {
        
        viewToAnimate = UIView(frame: CGRect(x: 75, y: 75, width: 75, height: 75))
        let colorArray=[UIColor.blue,UIColor.red,UIColor.magenta,UIColor.green,UIColor.yellow,UIColor.orange]
        let number = Int(arc4random_uniform(6))
        let xStartCord = Int(arc4random_uniform(375))
        let yStartCord = Int(arc4random_uniform(600))
        let xEndCord = Int(arc4random_uniform(375))
        let yEndCord = Int(arc4random_uniform(600))

        viewToAnimate.backgroundColor = colorArray[number]
        view.addSubview(viewToAnimate)
        let startPoint = CGPoint(x: xStartCord, y: yStartCord)
        let endPoint = CGPoint(x: xEndCord, y: yEndCord)
        let duration : Double = 4.0
        
        let positionAnimation = constructPositionAnimation(startingPoint: startPoint, endPoint: endPoint, animationDuration: duration)
        viewToAnimate.layer.add(positionAnimation, forKey: "position")
        viewToAnimate.layer.position = endPoint
        
        let scaleAnimation = constructScaleAnimation(startingScale: 1.0, endScale: 0.2, animationDuration: 2.5)
        viewToAnimate.layer.add(scaleAnimation, forKey: "scale")
        
        let rotateAnimation = constructRotationAnimation(animationDuration: 2.7)
        viewToAnimate.layer.add(rotateAnimation, forKey: "rotate")
        
        let opacityAnimation = constructOpacityAnimation(startingOpacity: 1.0, endOpacity: 0.0, animationDuration: 2.5)
        viewToAnimate.layer.add(opacityAnimation, forKey: "opacity")
    }
    
    private func constructRotationAnimation(animationDuration : Double) -> CABasicAnimation {
        let roationAnimation = CABasicAnimation(keyPath: "transform.rotation")
        roationAnimation.fromValue = 0
        roationAnimation.toValue = Double.pi * 2
        roationAnimation.duration = animationDuration
        roationAnimation.repeatCount = Float.infinity
        return roationAnimation
    }
    
    private func constructPositionAnimation(startingPoint : CGPoint, endPoint : CGPoint, animationDuration : Double) -> CABasicAnimation {
        let positionAnimation = CABasicAnimation(keyPath: "position")
        positionAnimation.fromValue = NSValue(cgPoint: startingPoint)
        positionAnimation.toValue = NSValue(cgPoint: endPoint)
        positionAnimation.duration = animationDuration
        positionAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        positionAnimation.repeatCount = Float.infinity
        positionAnimation.autoreverses = true
        return positionAnimation
    }
    
    private func constructScaleAnimation(startingScale : CGFloat, endScale : CGFloat, animationDuration : Double) -> CABasicAnimation {
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
        scaleAnimation.fromValue = startingScale
        scaleAnimation.toValue = endScale
        scaleAnimation.duration = animationDuration
        scaleAnimation.autoreverses = true
        scaleAnimation.repeatCount = Float.infinity
        return scaleAnimation
    }
    
    private func constructOpacityAnimation(startingOpacity : CGFloat, endOpacity : CGFloat, animationDuration : Double) -> CABasicAnimation {
        let opacityAnimation = CABasicAnimation(keyPath: "opacity")
        opacityAnimation.fromValue = startingOpacity
        opacityAnimation.toValue = endOpacity
        opacityAnimation.duration = animationDuration
        opacityAnimation.repeatCount = Float.infinity
        opacityAnimation.autoreverses = true
        return opacityAnimation
    }
}

