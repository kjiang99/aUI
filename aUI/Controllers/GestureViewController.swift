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
                let tapRecognizer = UITapGestureRecognizer(
                    target: self, action: #selector(handleTap)
                )
                tapRecognizer.delegate = self
                subview.addGestureRecognizer(tapRecognizer)
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Gesture"
        
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
