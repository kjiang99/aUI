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
        
        self.addChildViewController(child1ViewController)
        self.vwContainer.addSubview(child1ViewController.view)
        child1ViewController.view.frame = vwContainer.bounds
        child1ViewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        child1ViewController.didMove(toParentViewController: self)
    }
    
    @IBAction func tapChild2(_ sender: Any) {
        self.addChildViewController(child2ViewController)
        self.vwContainer.addSubview(child2ViewController.view)
        child2ViewController.didMove(toParentViewController: self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "ParentChild"
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        child1ViewController = storyboard.instantiateViewController(withIdentifier: "child1ViewController") as! Child1ViewController
        child2ViewController = storyboard.instantiateViewController(withIdentifier: "child2ViewController") as! Child2ViewController
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
        self.addChildViewController(child)
        self.view.addSubview(child.view)
        child.didMove(toParentViewController: self)
    }

    func remove() {
        guard parent != nil else {
            return
        }

        willMove(toParentViewController: nil)
        view.removeFromSuperview()
        removeFromParentViewController()
    }
}
