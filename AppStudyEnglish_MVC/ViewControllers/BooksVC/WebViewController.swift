//
//  WebViewController.swift
//  AppStudyEnglish_MVC
//
//  Created by sss on 07.01.2023.
//

import UIKit
import WebKit

final class WebViewController: UIViewController {

    // MARK: Properties
    
    var book: Book!
    private var webView: WKWebView!
    
    
    //MARK: ViewController life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        settingsNavigationItem()
        createWebView()

    }

    
    //MARK: - Methods
    
    private func settingsNavigationItem() {
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(dissmissVC))
        view.backgroundColor = .white
        navigationItem.title = book.name
        
    }
    private func createWebView() {
        
        webView = WKWebView(frame: view.bounds)
        webView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        view.addSubview(webView)
        
        
        if let myUrl = Bundle.main.url(forResource: book.resource, withExtension: "pdf") {
            let request = URLRequest(url: myUrl)
            webView.load(request)
        }
    }
    
    
    @objc func dissmissVC() {
        navigationController?.popViewController(animated: true)
    }

    
}
