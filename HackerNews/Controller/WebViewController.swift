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
    var urlToGoWebViewController: String?
    @IBOutlet weak var mainWebView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let safeUrlToGoWebViewController = urlToGoWebViewController{
            mainWebView.load(URLRequest(url: URL(string: safeUrlToGoWebViewController)!))
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
