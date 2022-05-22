//
//  WebViewController.swift
//  LSGames
//
//  Created by Can Yoldaş on 23.05.2022.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKUIDelegate {
    
    var webView: WKWebView!
    var webUrl: String?
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        openWebView()
    }
    
    private func openWebView() {
        guard let webUrl = webUrl else {
            return
        }
        
        let myURL = URL(string: webUrl)
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
    
    init(webUrl: String) {
        self.webUrl = webUrl
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}



