//
//  WebViewController.swift
//  HackerNews
//
//  Created by Kevin Gustavo Collado on 04/10/23.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    let mainVC = ViewController()
    //Variable
    var urlToGoWebViewController: String?
    @IBOutlet weak var mainWebView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //Obtener dato seguro del opcional
        if let safeUrlToGoWebViewController = urlToGoWebViewController{
            //Pasar parámetro seguro
            mainWebView.load(URLRequest(url: URL(string: safeUrlToGoWebViewController)!))
        }
    }
}
