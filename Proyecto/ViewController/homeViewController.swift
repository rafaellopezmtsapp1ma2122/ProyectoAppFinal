import UIKit

class homeViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    var selectedItem: Int?
    let cellSpacingHeight: CGFloat = 5
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        autoUpdate()
        let nib = UINib(nibName: "DemoTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "DemoTableViewCell")
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.reloadData()
    }
    

    
    var tabla: [Item] = []
   
    
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
               
                
                tabla.append(Item(json: o))
                
               
            }
            } catch let errorJson {
                print(errorJson)
            }
        
        self.tableView.reloadData()
        
    }
        

   func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return cellSpacingHeight
        }

    //Preparamos las celdas para añadirlas al table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tabla.count
       
        
    }
   
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "DemoTableViewCell", for: indexPath) as! DemoTableViewCell
        cell.objName.text = tabla[indexPath.row].nameObj
        cell.objTags.text = "Nintendo"
        cell.objPrice.text = tabla[indexPath.row].priceStr 
     
        
        let url = URL(string: tabla[indexPath.row].imagenObj)
        // Crear URL
        var image: UIImage?
     
          /*  do {
                let data = try Data(contentsOf: url!) // Crear objeto con los datos de la imagen
                image = UIImage(data: data) // Crear una image a partir de los datos
                cell.objImage.image = image
            } catch {
                cell.objImage.backgroundColor = .black
                print("Error al descargar imagen")
            }
           */
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedItem = indexPath.row
        self.performSegue(withIdentifier: "item", sender:
                            tabla[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let itemViewController = segue.destination as! itemViewController
        let item = sender as! Item
        itemViewController.item = item
    }

}
