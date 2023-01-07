//
//  BooksViewController.swift
//  AppStudyEnglish_MVC
//
//  Created by sss on 07.01.2023.
//

import UIKit

final class BooksViewController: UIViewController {

    //MARK: Properties
    
    private let identifier = "BookCell"
    let arrayOfBooks = Book.arrayOfBooks
    
    var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        createTableView()
        createTabBarItem()

    }

    //MARK: - Method
    
    private func createTableView () {
        
        tableView = UITableView(frame: view.bounds)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.autoresizingMask = [.flexibleHeight, .flexibleHeight]
        view.addSubview(tableView)
        
    }
    
    private func createTabBarItem () {
        
        title = "Книги"
        guard  let image = UIImage(systemName: "bookmark") else {return}
        self.tabBarItem = UITabBarItem(title: "Книги", image: image, tag: 3)
    }

}


//MARK: - UITableViewDelegate, UITableViewDataSource

extension BooksViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfBooks.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        var configuration = cell.defaultContentConfiguration()
        configuration.text = arrayOfBooks[indexPath.row].name
        configuration.textProperties.font = UIFont.systemFont(ofSize: 19)
        configuration.textProperties.color = .darkGray
        cell.contentConfiguration = configuration
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        // Create WebViewController
        
        let webViewController = WebViewController()
        webViewController.book = arrayOfBooks[indexPath.row]
        let navVC = UINavigationController(rootViewController: webViewController)
        present(navVC, animated: true)
    }
    
    
}
