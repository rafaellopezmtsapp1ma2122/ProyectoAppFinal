import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    static var token: String?
    
    static var userNameInpt: String?
    
    static var imageUser: String?
    var tabla: [User] = []
    
    @IBOutlet weak var myEmail: UITextField!
       
    @IBOutlet weak var myPaswd: UITextField!
    
    @IBAction func register(_ sender: UIButton) {
        self.performSegue(withIdentifier: "register", sender: sender)
    }
    
    @IBAction func switchRemember(_ sender: UISwitch) {
        if sender.isOn == true {
            print("recordar activado ")
        }else{
            print("recordar desactivado")
        }
    }
    
    @IBAction func logOn(_ sender: Any) {
        //Comprobamos que no esten vacios los textfield e iniciamos la acción del metodo post para enviar los datos de usuario
        
        if myEmail.text?.isEmpty == false && myPaswd.text?.isEmpty == false{
            
            guard let url =  URL(string:"http://127.0.0.1:5000/login")
            else{
                return
            }
            //Preparamos las variables a enviar
            let body: [String: String] = ["email": myEmail.text ?? "", "passwd": myPaswd.text ?? ""]
           
            let finalBody = try? JSONSerialization.data(withJSONObject: body)
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.httpBody = finalBody
            
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            
            //Enviamos los datos
            URLSession.shared.dataTask(with: request){ [self]
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
                
                //print(data, String(data: data, encoding: .utf8) ?? "*unknown encoding*")
                
                let jsonData = data
                
                let decoder = JSONDecoder()

                do {
                    let people = try decoder.decode([User].self, from: jsonData)
                    ViewController.userNameInpt = people[people.count].userName
                    ViewController.imageUser = people[people.count].imagenUser
                    
                } catch {
                    print(error.localizedDescription)
                }
                
                DispatchQueue.main.sync {
                    self.performSegue(withIdentifier: "goHome", sender: sender)
                }
                
            }.resume()
            
        }else{
            //Cambiamos el color de fondo de los textfield si estan vacios
            myPaswd.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0)
            myEmail.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0)
        }
    }
}

