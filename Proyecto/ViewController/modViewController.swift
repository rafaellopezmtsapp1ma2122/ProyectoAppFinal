//
//  modViewController.swift
//  Proyecto
//
//  Created by Apps2M on 6/2/23.
//

import UIKit


import Photos



class modViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

 
    
    @IBOutlet weak var image: UIImageView!
    
    
    @IBOutlet weak var userName: UITextField!
    
    let imagePicker = UIImagePickerController()

    @IBAction func backEdit(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

    override func viewDidLoad() {

        super.viewDidLoad()

        imagePicker.delegate = self

    }

    

    // Creamos una funcion para activar el ImagePicker.

    @IBAction func changeImage(_ sender: Any) {

        imagePicker.allowsEditing = false

        imagePicker.sourceType = .photoLibrary

        self.present(imagePicker, animated: true, completion: nil)

    }

    

    // Creamos la funcion para el funcionamiento del ImagePicker.

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

        let img = info[UIImagePickerController.InfoKey.originalImage] as? UIImage

        image.image = img

        self.dismiss(animated: true, completion: nil) // Cierra la galería al elejir foto.

    }

    

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) { // Si se cancela, regresa de nuevo.

        self.dismiss(animated: true, completion: nil)

    }

}
