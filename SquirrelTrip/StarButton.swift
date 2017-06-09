//
//  StarButton.swift
//  squirrelTrip
//
//  Created by Luis F. Bustos Ramirez on 01/11/16.
//  Copyright © 2016 Luis F. Bustos Ramirez. All rights reserved.
//

import UIKit


let π:CGFloat = CGFloat(M_PI)

@IBDesignable class StarButton: UIButton {
    
    @IBInspectable var shadowColor: UIColor = UIColor.lightGray
    @IBInspectable var numStars: Int = 5
    
    @IBInspectable var rankingColor: UIColor = UIColor.yellow
    @IBInspectable var ranking: Int = 3
    
    
    @IBInspectable var sides: Int = 5
    @IBInspectable var active: Bool = true
    
    override func draw(_ rect: CGRect) {
        shadowColor.setFill()
        
        let starView = StarRankingView()
        
        if(active){
            let star = starView.drawStarBezier(x: bounds.width/2, y: bounds.height/2, radius: bounds.height/4, sides: sides,  pointyness:2)
            star.fill()
        }else{
            for i in 1...numStars{
                if(ranking < i){
                    rankingColor.setFill()
                }
                let width: CGFloat = bounds.width
                let x = width * CGFloat(i) / CGFloat(numStars) - CGFloat(bounds.height/2)
                let star = starView.drawStarBezier(x: x, y: bounds.height/2, radius: bounds.height/4, sides: sides,  pointyness:2)
                star.fill()
            }
        }
        
        
        
    }
}
