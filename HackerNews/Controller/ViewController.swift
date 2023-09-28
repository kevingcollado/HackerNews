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
    //Outlets
    @IBOutlet weak var mainTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Implementar protocolo dataSource y delegate
        mainTableView.dataSource = self
        mainTableView.delegate = self
        //
        mainTableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "CustomCell")
        
        networkManager.getPost()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postTest.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as? CustomCell
        cell?.titleLabel.text = postTest[indexPath.row].title
        cell?.authorLabel.text = postTest[indexPath.row].author
        cell?.pointsLabel.text = postTest[indexPath.row].points.description
        cell?.createdAtLabel.text = postTest[indexPath.row].created_at
        return cell!
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(postTest[indexPath.row].title)
    }

}
