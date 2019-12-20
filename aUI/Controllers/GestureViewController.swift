//
//  GestureViewController.swift
//  aUI
//
//  Created by Haojun Jiang on 11/16/19.
//  Copyright © 2019 Haojun Jiang. All rights reserved.
//

import UIKit
import AVFoundation

class GestureViewController: UIViewController {
    let chompPlayer = AVAudioPlayer(fileName: "chomp")
    let laughPlayer = AVAudioPlayer(fileName: "hehehe")
    
    
    @IBOutlet var interactiveSubviews: [UIImageView]! {
        didSet {
            for subview in interactiveSubviews {
                let pan = UIPanGestureRecognizer(target: self, action: #selector(handlePan(recognizer:)))
                pan.delegate = self
                subview.addGestureRecognizer(pan)
                
                let pinch = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch(recognizer:)))
                pinch.delegate = self
                subview.addGestureRecognizer(pinch)
                
                let rotate = UIRotationGestureRecognizer(target: self, action: #selector(handleRotate(recognizer:)))
                rotate.delegate = self
                subview.addGestureRecognizer(rotate)
                
                let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
                tap.delegate = self
                subview.addGestureRecognizer(tap)
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Gesture"

        interactiveSubviews.compactMap {
          $0.gestureRecognizers!.first { $0 is UIPanGestureRecognizer }
        }
        .forEach { panRecognizer in
          panRecognizer.view!.gestureRecognizers!
          .first { $0 is UITapGestureRecognizer }!
          .require(toFail: panRecognizer)
        }
    }
    
    
    @objc func handlePan(recognizer: UIPanGestureRecognizer) {
        guard let recognizerView = recognizer.view else {
          return
        }
        
        let translation = recognizer.translation(in: view)
        recognizerView.center.x += translation.x
        recognizerView.center.y += translation.y
        recognizer.setTranslation(.zero, in: view)
        
        guard recognizer.state == .ended else {
          return
        }
        
        let velocity = recognizer.velocity(in: view)
        let vectorToFinalPoint = CGPoint(x: velocity.x / 15, y: velocity.y / 15)
        let bounds = view.bounds.inset(by: view.safeAreaInsets)
        var finalPoint = recognizerView.center
        finalPoint.x += vectorToFinalPoint.x
        finalPoint.y += vectorToFinalPoint.y
        finalPoint.x = min(max(finalPoint.x, bounds.minX), bounds.maxX)
        finalPoint.y = min(max(finalPoint.y, bounds.minY), bounds.maxY)
        let vectorToFinalPointLength = (
          vectorToFinalPoint.x * vectorToFinalPoint.x
          + vectorToFinalPoint.y * vectorToFinalPoint.y
        ).squareRoot()
        
        UIView.animate(
          withDuration: TimeInterval(vectorToFinalPointLength / 1800),
          delay: 0,
          options: .curveEaseOut,
          animations: { recognizerView.center = finalPoint }
        )
    }
    
    
    @objc func handlePinch(recognizer: UIPinchGestureRecognizer) {
      guard let recognizerView = recognizer.view else {
        return
      }
      
      recognizerView.transform = recognizerView.transform.scaledBy(x: recognizer.scale, y: recognizer.scale)
      recognizer.scale = 1
    }
    
    @objc func handleRotate(recognizer: UIRotationGestureRecognizer) {
      guard let recognizerView = recognizer.view else {
        return
      }
      
      recognizerView.transform = recognizerView.transform.rotated(by: recognizer.rotation)
      recognizer.rotation = 0
    }
    
    @objc func handleTap(_: UITapGestureRecognizer) {
        chompPlayer.play()
    }
}


extension GestureViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith _: UIGestureRecognizer) -> Bool {
        return true
    }
}

extension AVAudioPlayer {
    convenience init(fileName: String) {
        let url = Bundle.main.url(forResource: fileName, withExtension: "caf")!
        try! self.init(contentsOf: url)
        prepareToPlay()
    }
}
