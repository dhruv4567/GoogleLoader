//
//  ViewController.swift
//  animationCicle
//
//  Created by Dhruv Khatri on 25/12/15.
//  Copyright © 2015 Dhruv Khatri. All rights reserved.
//

import UIKit

var number_do : Int = Int()
var number_again : Int = Int()

var blueColor : UIColor = UIColor()
var greenColor : UIColor = UIColor()
var redColor : UIColor = UIColor()
var yellowColor : UIColor = UIColor()

class ViewController: UIViewController
{
    @IBOutlet weak var myView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        number_again = 1
        number_do = 1
        
        blueColor = UIColor(red: 66.0/255.0, green: 146.0/255.0, blue: 244.0/255.0, alpha: 1)
        greenColor = UIColor(red: 45.0/255.0, green: 174.0/255.0, blue: 99.0/255.0, alpha: 1)
        redColor = UIColor(red: 233.0/255.0, green: 55.0/255.0, blue: 0.0/255.0, alpha: 1)
        yellowColor = UIColor(red: 248.0/255.0, green: 182.0/255.0, blue: 2.0/255.0, alpha: 1)

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func startAnimation(sender: AnyObject) {
        doAnimation()
    }
func doAnimation()

{
    var ovalStartAngle : CGFloat = CGFloat()
    var ovalEndAngle : CGFloat = CGFloat()
    let progressLine = CAShapeLayer()

    switch number_do
    {
    case 1:
        ovalStartAngle = CGFloat(90.01 * M_PI/180)
        ovalEndAngle = CGFloat(0 * M_PI/180)
        progressLine.strokeColor = blueColor.CGColor
        number_do++
        break
    case 4:
        ovalStartAngle = CGFloat(180.01 * M_PI/180)
        ovalEndAngle = CGFloat(90 * M_PI/180)
        progressLine.strokeColor = redColor.CGColor
        number_do = 1
        break
     case 3:
        ovalStartAngle = CGFloat(-44.99 * M_PI/90)
        ovalEndAngle = CGFloat(180 * M_PI/180)
        progressLine.strokeColor = yellowColor.CGColor
        number_do++
        break
    case 2:
        ovalStartAngle = CGFloat(0.01 * M_PI/180)
        ovalEndAngle = CGFloat(-45 * M_PI/90)
        progressLine.strokeColor = greenColor.CGColor
        number_do++
        break
    default:
        ovalStartAngle = CGFloat(90.01 * M_PI/180)
        ovalEndAngle = CGFloat(90 * M_PI/180)
        break
    }
    
   
    // set up some values to use in the curve
   
    let ovalRect = CGRectMake(view.center.x/2, view.center.y/2, 30, 30)
    
    // create the bezier path
    let ovalPath = UIBezierPath()
    

    ovalPath.addArcWithCenter(CGPointMake(35.0, 35.0),
        radius: CGRectGetWidth(ovalRect) / 2,
        startAngle: ovalStartAngle,
        endAngle: ovalEndAngle, clockwise: true)
    
  
    
    
 
    progressLine.fillColor = UIColor.clearColor().CGColor
    progressLine.lineWidth = 5.0
    progressLine.lineCap = kCALineCapRound


    // one degree = pi/180. so...
    // rotate by 90
    let radians = (CGFloat) (M_PI);
    
    UIView.animateWithDuration(3.0) { () -> Void in
        self.myView.transform = CGAffineTransformMakeRotation(radians)
    }
    UIView.animateWithDuration(3.0) { () -> Void in
        self.myView.transform = CGAffineTransformMakeRotation(0)
    }
    progressLine.path = ovalPath.CGPath

    
    // add the curve to the screen

    
    // create a basic animation that animates the value 'strokeEnd'
    // from 0.0 to 1.0 over 3.0 seconds
    let animateStrokeEnd = CABasicAnimation(keyPath: "strokeEnd")
    animateStrokeEnd.duration = 1.0
    animateStrokeEnd.fromValue = 0.0
    animateStrokeEnd.toValue = 1.0
    
    
    // add the animation
    progressLine.addAnimation(animateStrokeEnd, forKey: "animate stroke end animation")
    myView.layer.addSublayer(progressLine)

    var timer1 = NSTimer.scheduledTimerWithTimeInterval(0.9, target: self, selector: Selector("againAnimation"), userInfo: nil, repeats: false)


}
    
    
    func againAnimation()
    {
        var ovalStartAngle : CGFloat = CGFloat()
        var ovalEndAngle : CGFloat = CGFloat()
        let progressLine = CAShapeLayer()

        switch number_again
        {
        case 1:
            ovalStartAngle = CGFloat(90.01 * M_PI/180)
            ovalEndAngle = CGFloat(0 * M_PI/180)
             number_again++
            break
        case 4:
            ovalStartAngle = CGFloat(180.01 * M_PI/180)
            ovalEndAngle = CGFloat(90 * M_PI/180)
            number_again = 1
            break
        case 3:
            ovalStartAngle = CGFloat(-44.99 * M_PI/90)
            ovalEndAngle = CGFloat(180 * M_PI/180)
            number_again++
            break
        case 2:
            ovalStartAngle = CGFloat(0.01 * M_PI/180)
            ovalEndAngle = CGFloat(-45 * M_PI/90)
            number_again++
            break
        default:
            ovalStartAngle = CGFloat(90.01 * M_PI/180)
            ovalEndAngle = CGFloat(90 * M_PI/180)
            break

        }
        
     
        let ovalRect = CGRectMake(myView.center.x, myView.center.y, 30, 30)
        
        // create the bezier path
        let ovalPath = UIBezierPath()
        
        ovalPath.addArcWithCenter(CGPointMake(35, 35),
            radius: CGRectGetWidth(ovalRect) / 2,
            startAngle: ovalStartAngle,
            endAngle: ovalEndAngle, clockwise: true)
        
        
        let radians = (CGFloat) (M_PI);
  
            progressLine.path = ovalPath.CGPath
        progressLine.strokeColor = UIColor.whiteColor().CGColor
        progressLine.fillColor = UIColor.clearColor().CGColor
        progressLine.lineWidth = 7.0
        progressLine.lineCap = kCALineCapRound
               let animateStrokeEnd = CABasicAnimation(keyPath: "strokeEnd")
        animateStrokeEnd.duration = 1.0
        animateStrokeEnd.fromValue = 0.0
        animateStrokeEnd.toValue = 1.0
        
        // add the animation
        myView.layer.addSublayer(progressLine)
        progressLine.addAnimation(animateStrokeEnd, forKey: "animate stroke end animation")
        
     var timer = NSTimer.scheduledTimerWithTimeInterval(0.9, target: self, selector: Selector("doAnimation"), userInfo: nil, repeats: false)

    }
}

