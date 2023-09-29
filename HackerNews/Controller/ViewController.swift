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
    let networkManager = NetworkManager()
    var resultAPIData = [Post]()
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
        networkManager.getPost { apiData in
            self.resultAPIData = apiData.hits
        }
        //Actualiza la tabla con los datos de la API
        DispatchQueue.main.async {
            self.mainTableView.reloadData()
        }
        
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(String(describing: resultAPIData))
        return resultAPIData.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as? CustomCell
        cell?.titleLabel.text = resultAPIData[indexPath.row].author
        cell?.authorLabel.text = resultAPIData[indexPath.row].author
        cell?.pointsLabel.text = resultAPIData[indexPath.row].points.description
        cell?.createdAtLabel.text = resultAPIData[indexPath.row].created_at
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(resultAPIData[indexPath.row].url!)
    }
    
}
