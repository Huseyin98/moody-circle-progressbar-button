//
//  ViewController.swift
//  moodyTimer
//
//  Created by Huseyin on 26.08.2020.
//  Copyright © 2020 Huseyin. All rights reserved.
//

import UIKit




class ViewController: UIViewController {

    @IBOutlet weak var circleBtn: UIButton!
    let shapeLayer = CAShapeLayer()
    let basicAnimation = CABasicAnimation(keyPath:"strokeEnd")
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        circleBtn.layer.cornerRadius = 0.5 * circleBtn.bounds.size.width
        circleBtn.layer.borderColor = UIColor.lightGray.cgColor
        circleBtn.layer.borderWidth = 1.0
        circleBtn.clipsToBounds = true
       // create my track layer
      let trackLayer = CAShapeLayer()
      let center = circleBtn.center
       // let center = self.view.center
      let circularPath = UIBezierPath(arcCenter: center, radius: 30, startAngle: -CGFloat.pi/2, endAngle: 2*CGFloat.pi, clockwise: true)
        trackLayer.path = circularPath.cgPath

        trackLayer.strokeColor = UIColor.lightGray.cgColor
        trackLayer.lineWidth = 10
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.lineCap = kCALineCapRound
        view.layer.addSublayer(trackLayer)
       
        // create shape layer
        shapeLayer.path = circularPath.cgPath
        
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.lineWidth = 10
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineCap = kCALineCapRound
        shapeLayer.strokeEnd = 0
        
        view.layer.addSublayer(shapeLayer)
    
        
        
        
        
        let longpress = UILongPressGestureRecognizer(target: self, action: #selector(pan))
        circleBtn.addGestureRecognizer(longpress)
      
    
        
        }
    
    @objc func pan(g:UILongPressGestureRecognizer)
    {
        switch g.state {
        case .began:
            print("beni darlama")
            handleTap()
        case .ended:
            print("end")
            //self.view.layer.removeAllAnimations()
            //basicAnimation.stopAnimating()
            shapeLayer.removeAllAnimations()
            
        default:
            print("hello")
        }
        
    }
    
    @objc private func handleTap()
    {
        
        print("dokunma")
        
        basicAnimation.toValue = 1
        basicAnimation.duration = 10
        
        basicAnimation.fillMode = kCAFillModeForwards
        basicAnimation.isRemovedOnCompletion = false
        
        shapeLayer.add(basicAnimation, forKey: "urSoBasic")
        
        
    }
    
    
    
    
    

    @IBAction func circleBtn(_ sender: Any) {
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

