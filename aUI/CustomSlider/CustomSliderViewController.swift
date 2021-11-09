//
//  CustomSliderViewController.swift
//  aUI
//
//  Created by Haojun Jiang on 11/4/21.
//  Copyright © 2021 Haojun Jiang. All rights reserved.
//

import UIKit
import Checkbox

class CustomSliderViewController: UIViewController {
    private let customSlider: CustomSlider = {
        let slider = CustomSlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.minimumValue = 2
        slider.maximumValue = 8
        slider.minimumTrackTintColor = .blue
        slider.addTarget(self, action: #selector(sliderValueChanged(sender:)), for: .valueChanged)
        return slider
    }()
    
    private let lblSliderValue: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Custom Slider"
        
        
        self.view.addSubview(customSlider)
        self.view.addSubview(lblSliderValue)
        
        let safeGuide = self.view.safeAreaLayoutGuide
        var constraints = [NSLayoutConstraint]()
        
        
        constraints.append(customSlider.topAnchor.constraint(equalTo: safeGuide.topAnchor, constant: 100))
        constraints.append(customSlider.leadingAnchor.constraint(equalTo: safeGuide.leadingAnchor, constant: 20))
        //constraints.append(customSlider.trailingAnchor.constraint(equalTo: safeGuide.trailingAnchor, constant: -20))
        constraints.append(customSlider.heightAnchor.constraint(equalToConstant: 5))
        constraints.append(customSlider.widthAnchor.constraint(equalToConstant: 200))
        
        constraints.append(lblSliderValue.heightAnchor.constraint(equalToConstant: 20))
        constraints.append(lblSliderValue.widthAnchor.constraint(equalToConstant: 20))
        NSLayoutConstraint.activate(constraints)
        
        customSlider.value = 4
    }
    
    @objc func sliderValueChanged(sender: UISlider) {
        let step: Float = 2
        let roundedValue = round(sender.value / step) * step
        sender.value = roundedValue
        
        let x = Int(round(sender.value))
        lblSliderValue.text = "\(x)"
        lblSliderValue.center = setUISliderThumbValueWithLabel(slider: sender)
    }
    
    func setUISliderThumbValueWithLabel(slider: UISlider) -> CGPoint {
        let sliderTrack: CGRect = slider.trackRect(forBounds: slider.bounds)
        let sliderFrm: CGRect = slider.thumbRect(forBounds: slider.bounds, trackRect: sliderTrack, value: slider.value)
        return CGPoint(x: sliderFrm.origin.x + slider.frame.origin.x + 12, y: slider.frame.origin.y - 25)
    }
}
