//
//  ImagePickerViewController.swift
//  aUI
//
//  Created by Haojun Jiang on 1/1/18.
//  Copyright © 2018 Haojun Jiang. All rights reserved.
//

import UIKit

class ImagePickerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Image Picker"
        
        picker.delegate = self
        photoLibraryView.backgroundColor = .black
        internetImageView.backgroundColor = .black
        
        if UserDefaults.standard.bool(forKey: "redSwitchOn") {
            redSwitch.isOn = true
            changeColorComponent(redSwitch)
        }
    }

    @IBOutlet weak var redSwitch: UISwitch!
    @IBOutlet weak var greenSwitch: UISwitch!
    @IBOutlet weak var blueSwitch: UISwitch!
    @IBOutlet weak var colorView: UIView!
    
    @IBAction func changeColorComponent (_ sender: UISwitch) {
        let r: CGFloat = self.redSwitch.isOn ? 1 : 0
        let g: CGFloat = self.greenSwitch.isOn ? 1 : 0
        let b: CGFloat = self.blueSwitch.isOn ? 1 : 0
        self.colorView.backgroundColor = UIColor (red: r, green: g, blue: b, alpha: 1)
    }
    
    @IBAction func redSwitchFlipped(_ sender: Any) {
        if redSwitch.isOn {
            UserDefaults.standard.set(true, forKey: "redSwitchOn")
        } else {
            UserDefaults.standard.set(false, forKey: "redSwitchOn")
        }
    }
    
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var alphaSlider: UISlider!
    @IBOutlet weak var colorView2: UIView!
    
    @IBAction func changeColorComponent2 (_ sender: Any) {
        let r: CGFloat = CGFloat (self.redSlider.value)
        let g: CGFloat = CGFloat (self.greenSlider.value)
        let b: CGFloat = CGFloat (self.blueSlider.value)
        let alpha: CGFloat = CGFloat (self.alphaSlider.value)
        self.colorView2.backgroundColor = UIColor(red: r, green: g, blue: b, alpha: alpha)
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
            picker.sourceType = UIImagePickerController.SourceType.camera
            picker.allowsEditing = false
            picker.cameraCaptureMode = .photo
            picker.modalPresentationStyle = .fullScreen
            self.present(picker,animated: true,completion: nil)
        }
    }
    

    // MARK: Pick from Internet
    @IBOutlet weak var internetImageView: UIImageView!
    @IBOutlet weak var labelUrl: UILabel!
    
    @IBAction func pickFromInternet (_ sender: Any) {
        let imageUrlString = "http://vote1.azurewebsites.net/images/Return.jpg"
        let imageURL = URL(string: imageUrlString)!
        
        let task = URLSession.shared.dataTask(with: imageURL) { (data, response, error) in
            if error == nil {
                let downloadImage = UIImage(data: data!)
                self.performUIUpdatesOnMain {
                    self.internetImageView.image = downloadImage
                    self.internetImageView.backgroundColor = .white
                    self.labelUrl.text = "From: \(imageUrlString)"
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


extension ImagePickerViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
// Local variable inserted by Swift 4.2 migrator.
let info = convertFromUIImagePickerControllerInfoKeyDictionary(info)

        let chosenImage = info[convertFromUIImagePickerControllerInfoKey(UIImagePickerController.InfoKey.originalImage)] as! UIImage
        photoLibraryView.image = chosenImage
        photoLibraryView.contentMode = .scaleAspectFit
        photoLibraryView.backgroundColor = .white
        dismiss(animated:true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromUIImagePickerControllerInfoKeyDictionary(_ input: [UIImagePickerController.InfoKey: Any]) -> [String: Any] {
	return Dictionary(uniqueKeysWithValues: input.map {key, value in (key.rawValue, value)})
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromUIImagePickerControllerInfoKey(_ input: UIImagePickerController.InfoKey) -> String {
	return input.rawValue
}
