//
//  SamplesTableViewController.swift
//  aUI
//
//  Created by Haojun Jiang on 4/14/19.
//  Copyright © 2019 Haojun Jiang. All rights reserved.
//

import UIKit

class SamplesTableViewController: UITableViewController {
    private let sampleNames = ["PackingList","Thermometer"] // ["PackingList","Thermometer", "Budget", "Clock", "Login", "Rating", "Graph"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    
    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return sampleNames.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "sampleCell") as? SamplesTableViewCell else { fatalError() }
        
        if let sampleImage = UIImage(named: sampleNames[indexPath.row]) {
            cell.sampleImageView.image = sampleImage
        }
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let preview = UIStoryboard(name: "Preview", bundle: nil)
        let sample = sampleNames[indexPath.row]
        let controller = preview.instantiateViewController(withIdentifier: sample)
        formatCloseButton(in: controller)
        self.present(controller, animated: true, completion: nil)
    }
    
    
    func formatCloseButton(in controller: UIViewController) {
        let closeButton = CloseButton(type: .roundedRect)
        closeButton.addTarget(self, action: #selector(closeController), for: .touchUpInside)
        closeButton.setTitle("Close", for: .normal)
        controller.view.addSubview(closeButton)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        let safeArea = controller.view.safeAreaLayoutGuide
        let top = closeButton.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 10)
        let trailing = closeButton.rightAnchor.constraint(equalTo: safeArea.rightAnchor, constant: -10)
        let width = closeButton.widthAnchor.constraint(equalToConstant: 50)
        let height = closeButton.heightAnchor.constraint(equalToConstant: 50)
        NSLayoutConstraint.activate([top, trailing, width, height])
    }
    
    @objc func closeController() {
        dismiss(animated: true, completion: nil)
    }
}
