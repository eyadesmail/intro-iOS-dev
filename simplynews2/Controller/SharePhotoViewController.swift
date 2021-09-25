//
//  SharePhotoViewController.swift
//  simplynews2
//
//  Created by Esmail, Eyad Ehab Younis Othman on 5/12/19.
//  Copyright © 2019 Esmail, Eyad Ehab Younis Othman. All rights reserved.
//

import UIKit
import Foundation
import Social
class SharePhotoViewController: UIViewController , UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var imgpicker : UIImagePickerController!

    @IBOutlet weak var imageview: UIImageView!
    



    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageview.image = info[.originalImage] as? UIImage
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func tofacebook(_ sender: Any) {
        let facebookController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
        facebookController?.setInitialText("Shared by SimplyNews")
        facebookController?.add(imageview.image)
        present(facebookController!, animated: true, completion: nil)
        
    }
    
    @IBAction func totwitter(_ sender: Any) {
        
        let twitterController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
        twitterController?.setInitialText("Shared by SimplyNews")
        twitterController?.add(imageview.image)
        present(twitterController!, animated: true, completion: nil)
    }
    
    @IBAction func tocamera(_ sender: Any) {
        
        imgpicker = UIImagePickerController()
        imgpicker.delegate = self
        imgpicker.sourceType = .camera
        imgpicker.cameraCaptureMode = .photo
        present(imgpicker, animated: true, completion: nil)
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
