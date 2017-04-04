//
//  StarRanking.swift
//  squirrelTrip
//
//  Created by Luis F. Bustos Ramirez on 03/11/16.
//  Copyright © 2016 Luis F. Bustos Ramirez. All rights reserved.
//

import UIKit



class StarRankingView: UIView {
    
    @IBInspectable var shadowColor: UIColor = UIColor.lightGray
    //@IBInspectable var numStars: Int = 4
    //@IBInspectable var rankingColor: UIColor = UIColor.yellow
    //@IBInspectable var ranking: Int = 2
    
    @IBInspectable var sides: Int = 6
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        
        let star = self.drawStarBezier(x: bounds.height/2, y: bounds.height/2, radius: bounds.height/4, sides: sides,  pointyness:2)
    
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = star.cgPath
        // apply other properties related to the path
        shapeLayer.strokeColor = UIColor.blue.cgColor
        shapeLayer.fillColor = UIColor.white.cgColor
        shapeLayer.lineWidth = 1.0
        shapeLayer.position = CGPoint(x: 10, y: 10)
        
        self.layer.addSublayer(shapeLayer)
        
        
    }
    
    
   
    override func draw(_ rect: CGRect) {
        
        let star = self.drawStarBezier(x: bounds.height/2, y: bounds.height/2, radius: bounds.height/4, sides: sides,  pointyness:2)
        

        
        // fill
        let fillColor = UIColor.white
        fillColor.setFill()
        
        let strokeColor = UIColor.blue
        strokeColor.setStroke()
        
        // fill and stroke the path (always do these last)
        star.fill()
        star.stroke()
        
    }
    
    /*
    override func draw(_ rect: CGRect) {
        shadowColor.setFill()
        
        let star = self.drawStarBezier(x: bounds.height/2, y: bounds.height/2, radius: bounds.height/4, sides: sides,  pointyness:2)
        star.fill()
        star.stroke()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = star.cgPath
        
        self.layer.addSublayer(shapeLayer)
        
        /*for i in 1...numStars{
            if(ranking < i){
                rankingColor.setFill()
            }
            let width: CGFloat = bounds.width
            let x = width * CGFloat(i) / CGFloat(numStars) - CGFloat(bounds.height/2)
            let star = self.drawStarBezier(x: x, y: bounds.height/2, radius: bounds.height/4, sides: sides,  pointyness:2)
            star.fill()
        }*/
    //}*/
    
    func degree2radian(a:CGFloat)->CGFloat {
        let b = π * a/180
        return b
    }
    
    func polygonPointArray(sides:Int, x:CGFloat, y:CGFloat, radius:CGFloat, adjustment:CGFloat=0)->[CGPoint] {
        let angle = degree2radian(a: 360/CGFloat(sides))
        let cx = x // x origin
        let cy = y // y origin
        let r  = radius // radius of circle
        var i = sides
        var points = [CGPoint]()
        while points.count <= sides {
            let xpo = cx - r * cos(angle * CGFloat(i) + degree2radian(a: adjustment))
            let ypo = cy - r * sin(angle * CGFloat(i) + degree2radian(a: adjustment))
            points.append(CGPoint(x: xpo, y: ypo))
            i -= 1;
        }
        return points
    }
    
    func starPath(x:CGFloat, y:CGFloat, radius:CGFloat, sides:Int,pointyness:CGFloat) -> CGPath {
        let adjustment = 360/sides/2
        let path = CGMutablePath()
        let points = polygonPointArray(sides: sides, x: x, y: y, radius: radius)
        let cpg = points[0]
        let points2 = polygonPointArray(sides: sides, x:x, y:y, radius:radius*pointyness, adjustment:CGFloat(adjustment))
        var i = 0
        path.move(to: cpg)
        for p in points {
            path.addLine(to: points2[i])
            path.addLine(to: p)
            i += 1
        }
        path.closeSubpath()
        return path
    }
    
    public func drawStarBezier(x:CGFloat, y:CGFloat, radius:CGFloat, sides:Int, pointyness:CGFloat)->UIBezierPath {
        let path = starPath(x: x, y: y, radius: radius, sides: sides,pointyness: pointyness)
        let bez = UIBezierPath(cgPath: path)
        return bez
    }
}
