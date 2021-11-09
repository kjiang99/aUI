//
//  CustomSlider.swift
//  aUI
//
//  Created by Haojun Jiang on 11/8/21.
//  Copyright © 2021 Haojun Jiang. All rights reserved.
//

import UIKit

//https://stackoverflow.com/questions/35452185/how-can-i-make-a-uislider-with-step-value
//https://blog.kiprosh.com/custom-uislider-using-swift-language/
//https://medium.com/@0209neha/creating-a-custom-uislider-7756bf898832

class CustomSlider: UISlider {
//    func addTickticksView -> UIView {
//        UIView
//        var stepValue = (self.maximumValue - self.minimumValue) /  Float(self.numberOfTicks)
//    }
//
    
//    override func thumbRect(forBounds bounds: CGRect, trackRect rect: CGRect, value: Float) -> CGRect
//    {
//        let unadjustedThumbrect = super.thumbRect(forBounds: bounds, trackRect: rect, value: value)
//
//      let thumbOffsetToApplyOnEachSide: CGFloat = 7
//      let minOffsetToAdd = -thumbOffsetToApplyOnEachSide
//      let offsetForValue = minOffsetToAdd + (14 * CGFloat(value / maximumValue))
//
//      var origin = unadjustedThumbrect.origin
//
//      origin.x += offsetForValue
//
//
//        if !offsetForValue.isNaN {
//        delegate.offsetLabel.text = "offset: \(offsetForValue)"
//        }
//
//      return CGRect(origin: origin, size: unadjustedThumbrect.size)
//    }
    
//    weak var delegate: ViewController!
//    private let thumbWidth: Float = 14
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addTicksLabels()
    }
    
    func addTicksLabels() {
        let rectForBounds = self.trackRect(forBounds: self.bounds)
        let width = rectForBounds.width
        let origin = rectForBounds.origin.x

        //Calculate X value corresponding to percentage of width
        let tick2 : CGFloat = 0
        let tick4 = 0.33 * width
        let tick6 = 0.66 * width
        let tick8 = width
        
        let labelHeight : CGFloat = 16
        let labelWidth : CGFloat = 12
        let labelY : CGFloat = 10
        
        let tickHeight : CGFloat = 12
        let tickWidth : CGFloat = 6
        
        for location in [tick2, tick4, tick6, tick8] {
            
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            if location == tick2 {
                label.text = "2"
            }
            if location == tick4 {
                label.text = "4"
            }
            if location == tick6 {
                label.text = "6"
            }
            if location == tick8 {
                label.text = "8"
            }
            
            let frameLabel = CGRect(x: origin + location - (labelWidth / 2), y: self.bounds.maxY + labelY, width: labelWidth, height: labelHeight)
            label.frame = frameLabel
            addSubview(label)
            
            let tickView = UIView()
            tickView.translatesAutoresizingMaskIntoConstraints = false
            tickView.backgroundColor = .green
            addSubview(tickView)
            
            let frame = CGRect(x: origin + location - (tickWidth / 2), y: self.bounds.midY - (tickHeight / 2), width: tickWidth, height: tickHeight)
            tickView.frame = frame
        }
        

        //To make annoying label disappear
        let emptyView = UIView()
        emptyView.translatesAutoresizingMaskIntoConstraints = false
        emptyView.backgroundColor = .white
        let frameEmptyView = CGRect(x: 0, y: self.bounds.maxY, width: 20, height: 12)
        emptyView.frame = frameEmptyView
        addSubview(emptyView)
        
        
//
//        let label2 = UILabel()
//        label2.text = "2"
//        label2.translatesAutoresizingMaskIntoConstraints = false
//        addSubview(label2)
//        let frame2 = CGRect(x: origin + min - 3, y: self.bounds.midY + 10, width: 12, height: 16)
//        label2.frame = frame2
       
//        let label4 = UILabel()
//        label4.translatesAutoresizingMaskIntoConstraints = false
//        label4.text = "4"
//        addSubview(label4)
//        let frame4 = CGRect(x: origin + third - 6, y: self.bounds.maxY + 8, width: 12, height: 16)
//        label4.frame = frame4

//        let label6 = UILabel()
//        label6.translatesAutoresizingMaskIntoConstraints = false
//        label6.text = "6"
//        addSubview(label6)
//        let frame6 = CGRect(x: origin + twoThirds - 6, y: self.bounds.maxY + 8, width: 12, height: 16)
//        label6.frame = frame6
        
    }
}
