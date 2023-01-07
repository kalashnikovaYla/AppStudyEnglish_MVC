//
//  MainTabBarController.swift
//  AppStudyEnglish_MVC
//
//  Created by sss on 07.01.2023.
//

import UIKit

final class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabs()
    }
    
    //MARK: Methods
    
    private func setupTabs() {
        
        // Create View Controllers:
        
        let layout = UICollectionViewFlowLayout()
        let collectionController = CollectionViewController(collectionViewLayout: layout)
        let testViewController = TestViewController()
        let booksViewController = BooksViewController()
        
        // Create Navigtion Controllers:
        
        let firstNavigationController = UINavigationController(rootViewController: collectionController)
        let secondNavigationController = UINavigationController(rootViewController: testViewController)
        let thirdNavigationController = UINavigationController(rootViewController: booksViewController)
        
    
        // Set array view controllers
        
        setViewControllers(
            [firstNavigationController, secondNavigationController, thirdNavigationController],
            animated: true
        )
        
        // Custome tabBar
        
        collectionController.navigationItem.largeTitleDisplayMode = .automatic
        testViewController.navigationItem.largeTitleDisplayMode = .automatic
        booksViewController.navigationItem.largeTitleDisplayMode = .automatic
         
        for nav in [firstNavigationController, secondNavigationController, thirdNavigationController] {
            nav.navigationBar.prefersLargeTitles = true
        }

        testViewController.loadViewIfNeeded()
        booksViewController.loadViewIfNeeded()
        
        
    }

}
