//
//  BugViewController.swift
//  aUI
//
//  Created by Haojun Jiang on 1/2/18.
//  Copyright © 2018 Haojun Jiang. All rights reserved.
//

import UIKit

class BugViewController: UIViewController {

    let bugFactory = BugFactory.sharedInstance()
    let maxBugs = 100
    let moveDuration = 3.0
    let disperseDuration = 1.0
    var bugs = [UIImageView]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let singleTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleSingleTap))
        self.view.addGestureRecognizer(singleTapRecognizer)
    }
    
    
    @objc func handleSingleTap(_ sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            let touchLocation: CGPoint = sender.location(in: sender.view)
            addBugToView(touchLocation)
        }
    }
    
    
    func addBugToView(_ touchLocation: CGPoint) {
        if bugs.count < maxBugs {
            let newBug = bugFactory.createBug()
            newBug.frame = CGRect.init(x: touchLocation.x - 64.0, y: touchLocation.y - 64.0, width: 128, height: 128)
            bugs.append(newBug)
            view.addSubview(newBug)
            moveBugsAnimation()
        }
        //        debugPrint(self)
        //        print (self)

    }

    
    func moveBugsAnimation() {
        UIView.animate(withDuration: moveDuration, animations: {
            for bug in self.bugs {
                let randomPosition = CGPoint(x: CGFloat(arc4random_uniform(UInt32(UInt(self.view.bounds.maxX - bug.frame.size.width))) + UInt32(bug.frame.size.width/2)), y: CGFloat(arc4random_uniform(UInt32(UInt(self.view.bounds.maxY - bug.frame.size.height))) + UInt32(bug.frame.size.height/2)))
                bug.frame = CGRect(x: randomPosition.x - bug.frame.size.width/1.5, y: randomPosition.y - bug.frame.size.height/1.5, width: BugFactory.bugSize.width, height: BugFactory.bugSize.height)
            }
        });
    }
    
    @IBAction func dismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}


//extension BugViewController {
//    override var canBecomeFirstResponder: Bool { return true }
//    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
//        if motion == .motionShake { disperseBugsAnimation() }
//    }
//}


extension BugViewController {
    override var description: String {
        return "BugViewController contains \(bugs.count) bugs...\n"
    }
    
    override var debugDescription: String {
        var index = 0
        var debugString = "BugViewController contains \(bugs.count) bugs...\n"
        for bug in bugs {
            debugString = debugString + "Bug\(index): \(bug.frame)\n"
            index += 1
        }
        return debugString
    }
}
