import UIKit

class profileViewController: UIViewController {

   
    var texto = ""
    
    
   
    @IBOutlet weak var Menu: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        Menu.showsMenuAsPrimaryAction = true
        Menu.menu = addMenuItems()
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

    

    
   



    
    
    
}


