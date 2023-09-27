//
//  ViewController.swift
//  HackerNews
//
//  Created by Kevin Gustavo Collado on 12/09/23.
//

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet weak var mainTableView: UITableView!
    let networkManager = NetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        networkManager.gestPost()
    }
}

//extension ViewController: UITableViewDelegate, UITableViewDataSource {
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        <#code#>
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        <#code#>
//    }
//
//}
