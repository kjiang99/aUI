//
//  ParentChildViewController.swift
//  aUI
//
//  Created by Haojun Jiang on 12/3/19.
//  Copyright © 2019 Haojun Jiang. All rights reserved.
//

import UIKit

class ParentChildViewController: UIViewController {
    var child1ViewController: Child1ViewController!
    var child2ViewController: Child2ViewController!
    
    @IBOutlet weak var vwContainer: UIView!
    
    @IBAction func tapChild1(_ sender: Any) {
        child2ViewController.remove()
        
        self.addChild(child1ViewController)
        
        UIView.transition(with: self.vwContainer, duration: 0.5, options: .transitionFlipFromLeft, animations: {
            self.vwContainer.addSubview(self.child1ViewController.view)
        }, completion: nil)
        
        child1ViewController.view.frame = vwContainer.bounds
        child1ViewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        child1ViewController.didMove(toParent: self)
    }
    
    @IBAction func tapChild2(_ sender: Any) {
        self.addChild(child2ViewController)
        
        UIView.transition(with: self.vwContainer, duration: 0.5, options: .transitionFlipFromLeft, animations: {
            self.vwContainer.addSubview(self.child2ViewController.view)
        }, completion: nil)
        
        child2ViewController.didMove(toParent: self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "ParentChild"
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        child1ViewController = storyboard.instantiateViewController(withIdentifier: "child1ViewController") as? Child1ViewController
        child2ViewController = storyboard.instantiateViewController(withIdentifier: "child2ViewController") as? Child2ViewController
    }
}


class Child1ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
    }
}


class Child2ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .blue
    }
}



extension UIViewController {
    func add(_ child: UIViewController) {
        self.addChild(child)
        self.view.addSubview(child.view)
        child.didMove(toParent: self)
    }

    func remove() {
        guard parent != nil else {
            return
        }

        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
}
