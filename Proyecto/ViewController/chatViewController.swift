import UIKit

class chatViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    var selectedItem: Int?
    @IBOutlet weak var nameChat: NSLayoutConstraint!
    
    @IBOutlet weak var chatView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        autoUpdate()
        let nib = UINib(nibName: "chatViewCell", bundle: nil)
        chatView.register(nib, forCellReuseIdentifier: "chatViewCell")
        super.viewDidLoad()
        chatView.delegate = self
        chatView.dataSource = self
        self.chatView.reloadData()
    }
    
    var tabla: [Forum] = []
   
    
    let url = URL(string: "https://superapi.netlify.app/api/db/eventos")!
    
    func autoUpdate(){
        
        do {
            //Cogemos los datos de la url
            let data = try Data(contentsOf: url)
            //Lo transformamos de JSON a datos que pueda usar swift
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
        
            //Creamos un array vacio para añadir las futuras varaibles que obtengamos del JSON
            var listaTemp: [Any] = []
           
            
            //Recorremos el JSON en busqueda de valores nulos y si no lo son se añaden al array anterior
            for explica in json as! [Any] {
               
                if type(of: explica) != NSNull.self{
                   
                    listaTemp.append(explica)
                    
                }
            }
            //Recorremos la lista que acabamos de crear y añadimos al otro array de objetos que hemos creado especificamente para las listas
            for o in listaTemp as! [[String: Any]] {
               
                
                tabla.append(Forum(json: o))
                
               
            }
            } catch let errorJson {
                print(errorJson)
            }
        
        self.chatView.reloadData()
        
    }
        
    //Preparamos las celdas para añadirlas al table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tabla.count
       
        
    }
   
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "chatViewCell", for: indexPath) as! chatViewCell
        //cell.userName.text = tabla[indexPath.row].nameUser
        //cell.mensage.text = tabla[indexPath.row].mensaje
        cell.userName.text = "Jonh David"
        cell.mensage.text = "ALBERTO ES UN OTAKO"
     
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedItem = indexPath.row
        self.performSegue(withIdentifier: "enterChat", sender:
                            tabla[indexPath.row])
    }
    
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let itemViewController = segue.destination as! itemViewController
        let item = sender as! Item
        itemViewController.item = item
    }*/

    

}
