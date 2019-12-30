//
//  PaintViewController.swift
//  Making4Comic
//
//  Created by 原田茂大 on 2019/12/29.
//  Copyright © 2019 geshi. All rights reserved.
//

import UIKit

class Canvas: UIView{
    
    override func draw(_ rect: CGRect) {
        
        super.draw(rect)
        
        guard let context = UIGraphicsGetCurrentContext()else {
            
            return
        }
        
//        let startPoint = CGPoint(x: 0, y: 0)
//        let endPoint = CGPoint(x: 100, y: 100)
//
//        context.move(to: startPoint)
//        context.addLine(to: endPoint)
        
        line.forEach { (p) in
            
            
            
        }
        
        for (i, p) in line.enumerated(){
            
            if i == 0{
                context.move(to: p)
            }else{
                context.addLine(to: p)
            }
            
        }
        
        context.strokePath()
        
    }
    
    var line = [CGPoint]()
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let point = touches.first?.location(in: nil)else{
            return
        }
        
        print(point)
        
        line.append(point)
        
    }
    
}

class PaintViewController: UIViewController {
    
    let canvas = Canvas()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.addSubview(canvas)
        canvas.backgroundColor = .white
        canvas.frame = view.frame
    }
    
    
    

}
