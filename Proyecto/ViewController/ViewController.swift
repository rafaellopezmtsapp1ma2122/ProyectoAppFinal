import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    var token: String?
    
    @IBOutlet weak var myUser: UITextField!
    
  
   
    @IBOutlet weak var myPaswd: UITextField!
    
    
    @IBAction func register(_ sender: UIButton) {
        
       
            self.performSegue(withIdentifier: "register", sender: sender)
       
   
    }
    @IBAction func switchRemember(_ sender: UISwitch) {
        if sender.isOn == true {
            print("recorfar activado ")
        }else{
            print("recordatoria desactivado")
        }
    }
    @IBAction func logOn(_ sender: Any) {
        //Comprobamos que no esten vacios los textfield e iniciamos la acción del metodo post para enviar los datos de usuario
        
        if myUser.text?.isEmpty == false && myPaswd.text?.isEmpty == false{
            
            guard let url =  URL(string:"http://127.0.0.1:5000/login")
            else{
                return
            }
            //Preparamos las variables a enviar
            let body: [String: String] = ["nombre": myUser.text ?? "", "paswd": myPaswd.text ?? ""]
           
            let finalBody = try? JSONSerialization.data(withJSONObject: body)
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.httpBody = finalBody
            
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            
            //Enviamos los datos
            URLSession.shared.dataTask(with: request){
                (data, response, error) in
                print(response as Any)
                if let error = error {
                    print(error)
                    return
                }
                guard let data = data else{
                    return
                }
                //Recibimos la respuesta del servido si existe o no el usuario enviado y devuelve correcto o incorrecto y ya mandamos a la página correspondiente.
                
                print(data, String(data: data, encoding: .utf8) ?? "*unknown encoding*")
                self.token = String(data: data, encoding: .utf8)
                if String(data: data, encoding: .utf8) == "Login succesful"{
                    DispatchQueue.main.sync {
                        self.performSegue(withIdentifier: "goHome", sender: sender)
                    }
                }
               
            }.resume()
            
        }else{
            //Cambiamos el color de fondo de los textfield si estan vacios
            myPaswd.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0)
            myUser.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0)
        }
       
    }
    
    
    
    
   
    

}

