//
//  createItemViewController.swift
//  Proyecto
//
//  Created by Apps2M on 13/2/23.
//

import UIKit

class createItemViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var img: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var tags: UITextField!
    @IBOutlet weak var des: UITextField!
    @IBOutlet weak var price: UITextField!
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
    }
    
    @IBAction func confirm(_ sender: Any) {
        guard let url = URL(string:"http://127.0.0.1:5000/postItem")
        else {
            return
        }
        
        // Try cacht
       
        let imageData:NSData = image.image!.pngData()! as NSData
//        print("\n AAAAAAAA: ", imageData)
       
        let strBase64 = imageData.base64EncodedString(options: .lineLength64Characters)
//        print("\n BASE64: ", strBase64)
        
        // Le damos los datos del Array.
        let body: [String: Any] = ["name": name.text ?? "Empty", "des": des.text ?? "Empty", "img": strBase64, "price": price.text! + "€" ]
        var request = URLRequest(url: url)
        
        // Pasamos a Json el Array.
        
        let finalBody = try? JSONSerialization.data(withJSONObject: body)
        request.httpMethod = "POST"
        request.httpBody = finalBody //
        
        // add headers for the request
        request.addValue("application/json", forHTTPHeaderField: "Content-Type") // change as per server requirements
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        URLSession.shared.dataTask(with: request){
            (data, response, error) in
            print(response as Any)
            // Imprime el error en caso de que haya un fallo
            if let error = error {
                print(error)
                return
            }
            guard let data = data else{
                print("Error al recivir data.")
                return
            }
            print("\n\n\n")
            print(data, String(data: data, encoding: .utf8) ?? "*unknown encoding*")
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "home", sender: sender)
            }
            
        }.resume()
    }
    
    @IBAction func changeImage(_ sender: Any) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        self.present(imagePicker, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let img = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        image.image = img
        self.dismiss(animated: true, completion: nil) // Cierra la galería al elejir foto.
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) { // Si se cancela, regresa de nuevo.
        self.dismiss(animated: true, completion: nil)
    }

}
