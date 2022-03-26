//
//  PackingListViewController.swift
//  aUI
//
//  Created by Haojun Jiang on 4/19/19.
//  Copyright © 2019 Haojun Jiang. All rights reserved.
//

import UIKit

class PackingListViewController: UIViewController {
    
    var menuIsOpen = false
    var slider: HorizontalItemList!
    var items: [Int] = [5, 6, 7]
    
    @IBOutlet var menuButton: UIButton!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var menuHeightConstraint: NSLayoutConstraint!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeSlider()
    }

    
    @IBAction func toggleMenu(_ sender: AnyObject) {
        menuIsOpen = !menuIsOpen
        
        titleLabel.text = menuIsOpen ? "Select Item" : "Packing List"
        menuHeightConstraint.constant = menuIsOpen ? 200 : 80
        
        UIView.animate(
            withDuration: 0.67,
            delay: 0.0,
            options: .curveEaseIn,
            animations: {
                let angle: CGFloat = self.menuIsOpen ? .pi / 4 : 0.0
                self.menuButton.transform = CGAffineTransform(rotationAngle: angle)
                self.view.layoutIfNeeded()
        },
            completion: nil
        )
    }
    
    
    func makeSlider() {
        slider = HorizontalItemList(inView: self.view)
        slider.didSelectItem = { [weak self] index in //Add [weak self]
            self?.items.append(index)
//            self.tableView.reloadData()
//            self.transitionCloseMenu()
        }
        self.titleLabel.superview?.addSubview(slider)
    }
    
}
