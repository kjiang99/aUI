//
//  CAViewController.swift
//  aUI
//
//  Created by Haojun Jiang on 7/6/18.
//  Copyright © 2018 Haojun Jiang. All rights reserved.
//

//https://www.raywenderlich.com/169004/calayer-tutorial-ios-getting-started
import UIKit

class CAViewController: UIViewController {
    
    @IBOutlet weak var viewForLayer: UIView!
    
    @IBAction func tapGestureRecognized(_ sender: Any) {
         layer.shadowOpacity = layer.shadowOpacity == 0.7 ? 0.0 : 0.7
    }
    
    @IBAction func pinchGestureRecognized(_ sender: UIPinchGestureRecognizer) {
        let offset: CGFloat = sender.scale < 1 ? 5.0 : -5.0
        let oldFrame = layer.frame
        let oldOrigin = oldFrame.origin
        let newOrigin = CGPoint(x: oldOrigin.x + offset, y: oldOrigin.y + offset)
        let newSize = CGSize(width: oldFrame.width + (offset * -2.0), height: oldFrame.height + (offset * -2.0))
        let newFrame = CGRect(origin: newOrigin, size: newSize)
        if newFrame.width >= 100.0 && newFrame.width <= 300.0 {
            layer.borderWidth -= offset
            layer.cornerRadius += (offset / 2.0)
            layer.frame = newFrame
        }
    }
    
    var layer: CALayer {
        return viewForLayer.layer
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Basic CA Layer"
        setUpLayer()
    }
    
    func setUpLayer() {
        layer.backgroundColor = UIColor.blue.cgColor
        layer.borderWidth = 50.0
        layer.borderColor = UIColor.green.cgColor
        layer.shadowOpacity = 0.7
        layer.shadowRadius = 10.0
        
        layer.contents = UIImage(named: "d3")?.cgImage
        layer.contentsGravity = kCAGravityCenter
    }
    
    
}
