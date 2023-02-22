import UIKit

class homeViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    var token = String()
    var selectedItem: Int?
    var okCell = false
    let cellSpacingHeight: CGFloat = 5
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    @IBAction func create(_ sender: UIButton) {
        okCell = false
        self.performSegue(withIdentifier: "create", sender:
                            sender)
    }
    
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        tabla.removeAll()
        self.token = ViewController.token ?? ""
        let nib = UINib(nibName: "DemoTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "DemoTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.reloadData()
        updateElementsTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tabla.removeAll()
        tableView.reloadData()
        updateElementsTableView()
    }
    
    var tabla: [Item] = []
   
    
    let url = URL(string: "http://127.0.0.1:5000/getItem")!
    
    func updateElementsTableView(){
        
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
        cell.objTags.text = tabla[indexPath.row].tagsObj
        cell.objPrice.text = tabla[indexPath.row].stringPrice
        if tabla[indexPath.row].fav == 0{
            cell.favItem.setImage(UIImage(named:"favorito"), for: .normal)
        }else{
            cell.favItem.setImage(UIImage(named:"estrella"), for: .selected)
        }
        
        
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        selectedItem = indexPath.row
        okCell = true
        self.performSegue(withIdentifier: "item", sender:
                            tabla[indexPath.row])
        
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if okCell == true{
            let ItemViewController = segue.destination as! itemViewController
            let item = sender as! Item
            ItemViewController.item = item
        }
       
    }
    
    
    static func favoriteOk() {
        
        guard let urlFav = URL(string:"http://127.0.0.1:5000/postItem")
        else {
            return
        }
    
        // Le damos los datos del Array.
        let body: [String: Any] = ["name": DemoTableViewCell.name ?? "Empty", "favorite": 1 ]
        var request = URLRequest(url: urlFav)
        
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
            
            
        }.resume()
    }
    
    static func favoriteNo() {
        
        guard let urlUnFav = URL(string:"http://127.0.0.1:5000/postItem")
        else {
            return
        }
    
        // Le damos los datos del Array.
        let body: [String: Any] = ["name": DemoTableViewCell.name ?? "Empty", "favorite": 0 ]
        var request = URLRequest(url: urlUnFav)
        
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
            
            
        }.resume()
    }
    
}

