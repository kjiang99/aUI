//
//  ImagePickerViewController.swift
//  aUI
//
//  Created by Haojun Jiang on 1/1/18.
//  Copyright © 2018 Haojun Jiang. All rights reserved.
//

import UIKit

class ImagePickerViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        photoLibraryView.backgroundColor = .black
        internetImageView.backgroundColor = .black
    }

    
    // MARK: Pick from Photo Library
    //https://makeapppie.com/2016/06/28/how-to-use-uiimagepickercontroller-for-a-camera-and-photo-library-in-swift-3-0/
    let picker = UIImagePickerController()
    
    @IBOutlet weak var photoLibraryView: UIImageView!
    
    @IBAction func pickFromPhotoLibrary (_ sender: Any) {
        picker.sourceType = .photoLibrary
        self.present(picker, animated: true, completion: nil)
    }
    
    
    @IBAction func shootPhoto(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            picker.sourceType = UIImagePickerControllerSourceType.camera
            picker.allowsEditing = false
            picker.cameraCaptureMode = .photo
            picker.modalPresentationStyle = .fullScreen
            self.present(picker,animated: true,completion: nil)
        }
    }
    

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        photoLibraryView.image = chosenImage
        photoLibraryView.contentMode = .scaleAspectFit
        photoLibraryView.backgroundColor = .white
        dismiss(animated:true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    

    // MARK: Pick from Internet
    @IBOutlet weak var internetImageView: UIImageView!
    @IBOutlet weak var labelUrl: UILabel!
    
    let imageUrlString = "http://vote1.azurewebsites.net/images/Return.jpg"
    
    @IBAction func pickFromInternet (_ sender: Any) {
        let imageURL = URL(string: imageUrlString)!
        
        let task = URLSession.shared.dataTask(with: imageURL) { (data, response, error) in
            
            if error == nil {
                let downloadImage = UIImage(data: data!)
                self.performUIUpdatesOnMain {
                    self.internetImageView.image = downloadImage
                    self.internetImageView.backgroundColor = .white
                    self.labelUrl.text = "From: \(self.imageUrlString)"
                }
            } else {
                print(error.debugDescription)
            }
        }
        
        task.resume()
    }
    
    
    //MARK: GCDBlackBox
    func performUIUpdatesOnMain(_ updates: @escaping () -> Void) {
        DispatchQueue.main.async {
            updates()
        }
    }
}
