import UIKit

class profileViewController: UIViewController,UITableViewDataSource, UITableViewDelegate  {
    
    var tabla: [Item] = []
    var tablaFav: [Item] = []
    
    var texto = ""
    
    @IBOutlet weak var nameUser: UILabel!
    
    @IBOutlet weak var imageUser: UIImageView!
    
    @IBOutlet weak var myElementsTable: UITableView!
    
    @IBOutlet weak var myFavoritesTable: UITableView!
    
    @IBOutlet weak var Menu: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        Menu.showsMenuAsPrimaryAction = true
        Menu.menu = addMenuItems()
        
        let nib = UINib(nibName: "DemoTableViewCell", bundle: nil)
        myElementsTable.register(nib, forCellReuseIdentifier: "DemoTableViewCell")
        super.viewDidLoad()
        myElementsTable.delegate = self
        myElementsTable.dataSource = self
        self.myElementsTable.reloadData()
        
        myFavoritesTable.register(nib, forCellReuseIdentifier: "DemoTableViewCell")
        super.viewDidLoad()
        myFavoritesTable.delegate = self
        myFavoritesTable.dataSource = self
        self.myFavoritesTable.reloadData()
        
    }


func addMenuItems() -> UIMenu{
    let menuItems = UIMenu(title: "Options", options: .displayInline, children: [

            UIAction(title: "Edit Profile", handler: { (_) in print("Edit")

                self.performSegue(withIdentifier: "editProfile", sender: UIAction.self)

            }),

            UIAction(title: "Settings", handler: { (_) in print("Settings")

                

            }),

            UIAction(title: "Logout", attributes: .destructive, handler: { (_) in print("Logout")

                self.performSegue(withIdentifier: "logOut", sender:
                                    UIAction.self)

            }),

            ])

            return menuItems

}

    
    func favorites(){
        
        
    }
    
    func updateMyElementsTableView(){
        
        
    }
    
   

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tabla.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DemoTableViewCell", for: indexPath) as! DemoTableViewCell
        cell.objName.text = tabla[indexPath.row].nameObj
        cell.objTags.text = tabla[indexPath.row].tagsObj
        cell.objPrice.text = tabla[indexPath.row].priceObj
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


