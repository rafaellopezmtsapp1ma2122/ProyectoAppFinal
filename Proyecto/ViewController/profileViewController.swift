import UIKit

class profileViewController: UIViewController,UITableViewDataSource, UITableViewDelegate  {

    //Generamos las variables
    var tabla: [Item] = []
    
    var tablaFav: [Item] = []
    
    var texto = ""
    
    
    
    //Implementamos los outlets y las func
    
    @IBOutlet weak var nameUser: UILabel!
    
    @IBOutlet weak var imageUser: UIImageView!
    
    @IBOutlet weak var myElementsTable: UITableView!
    
    @IBOutlet weak var Menu: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Cargamos la imagen de perfil
        
        if ViewController.user?.image != ""{
            profileImg()
        }
        //Colocamos el nombre de usuario
        nameUser.text = ViewController.user?.name
        //Preparamos el menú
        Menu.showsMenuAsPrimaryAction = true
        Menu.menu = addMenuItems()
        //Preparamis las celdas asociando al archivo xib corresponsiente.
        let nib = UINib(nibName: "DemoTableViewCell", bundle: nil)
        myElementsTable.register(nib, forCellReuseIdentifier: "DemoTableViewCell")
        //Referenciamos el delegate y el dataSource
        myElementsTable.delegate = self
        myElementsTable.dataSource = self
        //Refrescamis la table view
        self.myElementsTable.reloadData()
        
        
    }

//Generamos una funcion que permita dar una acción a los distintos elementos del menú ademas de dar propiedades al mismo desplegable
    func addMenuItems() -> UIMenu{
        
        //Variable para el botón options
        let menuItems = UIMenu(title: "Options", options: .displayInline, children: [

            UIAction(title: "Edit Profile", handler: { (_) in print("Edit")

                self.performSegue(withIdentifier: "editProfile", sender: UIAction.self)

            }),

            //Variable para boton settings
            UIAction(title: "Settings", handler: { (_) in print("Settings")

                

            }),
            
            //Variable para boton settings
            UIAction(title: "Logout", attributes: .destructive, handler: { (_) in print("Logout")
                
                //Cambiamos de view controller al del login
                self.performSegue(withIdentifier: "logOut", sender:
                                    UIAction.self)

            }),

            ])

            return menuItems

    }
   
    //Función para la conversión de la imagen de Base64 a imagen y poderla implementarla en el lugar correspondiente
    func profileImg(){
       
        let strBase64 = ViewController.imageUser!
        do {
            //Generamos las variable de las diferentes imagenes tanto codificadas como para codificar
            let dataDecoded : Data = Data(base64Encoded: strBase64, options: .ignoreUnknownCharacters)!
            let decodedimage:UIImage = UIImage(data: dataDecoded as Data)!
            print(decodedimage)
            //Colocamos la imagen en su lugar correspondiente
            imageUser.image = decodedimage
        }
        catch {
            //Si se produce algun error colocamos una imagen por defecto y imprimimos un error
            imageUser.image = UIImage(named: "3.png")
            print("Error jajaj xd")
        }
       
    }
    //Funcion para el conteo de los elementos los cuales se van a añadir a ese table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tabla.count
        
    }
    //Genermos las celdas con sus datos correspondientes en sus celdas
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DemoTableViewCell", for: indexPath) as! DemoTableViewCell
        cell.objName.text = tabla[indexPath.row].nameObj
        cell.objTags.text = tabla[indexPath.row].tagsObj
        cell.objPrice.text = tabla[indexPath.row].stringPrice
        //Decodifocamos la imagen para su postorior uso en la celda
        let strBase64 = tabla[indexPath.row].imagenObj
        do {
            let dataDecoded : Data = Data(base64Encoded: strBase64, options: .ignoreUnknownCharacters)!
            let decodedimage:UIImage = UIImage(data: dataDecoded as Data)!
            print(decodedimage)
            cell.objImage.image = decodedimage
        }
        catch {
            cell.objImage.backgroundColor = .black
            print("Error jajaj xd")
        }
        
       
        return cell
    }


    
    
    


}
