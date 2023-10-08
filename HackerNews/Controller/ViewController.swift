//
//  ViewController.swift
//  HackerNews
//
//  Created by Kevin Gustavo Collado on 12/09/23.
//

import UIKit
import Alamofire

class ViewController: UIViewController{
    //Instancia de NetworkManager
    var resultAPIData = [Post]()
    //Variables
    var urlToGoViewController: String?
    //Outlets
    @IBOutlet weak var mainTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Implementar protocolo dataSource y delegate
        mainTableView.dataSource = self
        mainTableView.delegate = self
        //Registrar celda personalizada
        mainTableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "CustomCell")
        
        //Llama al método getPost() para obtener los datos de la API
        NetworkManager.sharedInstanced.getPost { apiData in
            self.resultAPIData = apiData.hits
            //Actualiza la tabla con los datos de la API
            DispatchQueue.main.async {
                self.mainTableView.reloadData()
            }
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    //Número de filas
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultAPIData.count
    }
    
    //Altura automática
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return UITableView.automaticDimension
    }
    
    //Pintar datos en celda
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as? CustomCell
        cell?.titleLabel.text = resultAPIData[indexPath.row].title
        cell?.authorLabel.text = resultAPIData[indexPath.row].author
        cell?.pointsLabel.text = resultAPIData[indexPath.row].points?.description
        cell?.createdAtLabel.text = resultAPIData[indexPath.row].created_at
        return cell!
    }
    
    //Obtener dato de celda seleccionada
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let resultAPIDataSafe = resultAPIData[indexPath.row].url{
            urlToGoViewController = resultAPIDataSafe
            self.performSegue(withIdentifier: "mainViewControllerToWebViewController", sender: self)
        }
        //Deseleccionar celda
        mainTableView.deselectRow(at: indexPath, animated: true)
    }
    
    //Sobreescribir el método prepare y pasar datos entre pantallas
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destino = segue.destination as? WebViewController{
            destino.urlToGoWebViewController = self.urlToGoViewController
        }
    }
    
}
