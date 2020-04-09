//
//  ParentChildViewController.swift
//  aUI
//
//  Created by Haojun Jiang on 12/3/19.
//  Copyright © 2019 Haojun Jiang. All rights reserved.
//

import UIKit

class ParentChildViewController: UIViewController {
    var child1ViewController: ChildViewController1!
    var child2ViewController: ChildViewController2!
    
    @IBOutlet weak var vwContainer: UIView!
    
    @IBAction func tapChild1(_ sender: Any) {
        child2ViewController.remove()
        
        self.addChild(child1ViewController)
        
        UIView.transition(with: self.vwContainer, duration: 0.5, options: .transitionFlipFromLeft, animations: {
            self.vwContainer.addSubview(self.child1ViewController.view)
        }, completion: nil)
        
        child1ViewController.didMove(toParent: self)
        child1ViewController.view.frame = vwContainer.bounds
        child1ViewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
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
        child1ViewController = storyboard.instantiateViewController(withIdentifier: "ChildViewController1") as? ChildViewController1
        child2ViewController = storyboard.instantiateViewController(withIdentifier: "ChildViewController2") as? ChildViewController2
    }
}


class ChildViewController1: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .clear  //Must be clear so that can see the underlying view
        initializeAlertView()
    }
    
    
    func initializeAlertView() {
        let alertView: UIView = {
            let uiView = UIView()
            uiView.backgroundColor = .lightGray
            uiView.layer.cornerRadius = 20
            uiView.translatesAutoresizingMaskIntoConstraints = false
            return uiView
        }()
        
        
        let stackView : UIStackView = {
            let stackView = UIStackView()
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.axis = .vertical
            stackView.distribution = .fillEqually
            stackView.alignment = .fill
            stackView.spacing = 0
            return stackView
        }()
        
        let connectingLabel: UILabel = {
            let label = UILabel()
            label.text = "Connecting..."
            label.font = label.font.withSize(25)
            label.textAlignment = .center
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        let activityIndicator : UIActivityIndicatorView = {
            let activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
            activityIndicator.translatesAutoresizingMaskIntoConstraints = false
            activityIndicator.startAnimating()
            return activityIndicator
        }()
        
        let cancelButton: UIButton = {
            let button = UIButton()
            button.setTitle("Cancel", for: .normal)
            button.setTitleColor(.systemBlue, for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 25)
            button.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
        
        
        self.view.addSubview(alertView)
        alertView.addSubview(stackView)
        stackView.addArrangedSubview(connectingLabel)
        stackView.addArrangedSubview(activityIndicator)
        stackView.addArrangedSubview(cancelButton)
        
        let safeGuide = self.view.safeAreaLayoutGuide
        var constraints = [NSLayoutConstraint]()
        
        constraints.append(alertView.centerYAnchor.constraint(equalTo: safeGuide.centerYAnchor, constant: 0))
        constraints.append(alertView.heightAnchor.constraint(equalToConstant: 150))
        constraints.append(alertView.leadingAnchor.constraint(equalTo: safeGuide.leadingAnchor, constant: 50))
        constraints.append(alertView.trailingAnchor.constraint(equalTo: safeGuide.trailingAnchor, constant: -50))
        
        constraints.append(stackView.topAnchor.constraint(equalTo: alertView.topAnchor, constant: 0))
        constraints.append(stackView.bottomAnchor.constraint(equalTo: alertView.bottomAnchor, constant: 0))
        constraints.append(stackView.leadingAnchor.constraint(equalTo: alertView.leadingAnchor, constant: 0))
        constraints.append(stackView.trailingAnchor.constraint(equalTo: alertView.trailingAnchor, constant: 0))
        
        NSLayoutConstraint.activate(constraints)
    }
    
    var onCancelButtonTapped: (() -> Void)?
    
    @objc func cancelButtonTapped() {
        onCancelButtonTapped?()
    }
}


class ChildViewController2: UIViewController {
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
        
        self.willMove(toParent: nil)
        self.view.removeFromSuperview()
        self.removeFromParent()
    }
}
