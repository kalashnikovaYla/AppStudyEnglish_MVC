//
//  CollectionViewController.swift
//  AppStudyEnglish_MVC
//
//  Created by sss on 07.01.2023.
//

import UIKit

private let reuseIdentifier = "Cell"

final class CollectionViewController: UICollectionViewController {

    //MARK: Properties
    
    private var card: Card!
    private let arrayOfCard = Card.arrayData
    
    let itemPerRow: CGFloat = 2
    let sectionInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    
    
    //MARK: ViewController life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingsCollectionView()
        createTabBarItem()
        
    }
    
    
    //MARK: Methods
    
    func settingsCollectionView() {
        
        // Register cell classes
        
        self.collectionView!.register(CardCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Settings collectionViewLayout
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        
        let paddingWidth = sectionInsets.left * (itemPerRow + 1)
        let avableWidth = collectionView.frame.width - paddingWidth
        let widthPerItem = avableWidth/itemPerRow

        layout.itemSize = CGSize(width: widthPerItem, height: widthPerItem)
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        layout.scrollDirection = .vertical
    }
    
    private func createTabBarItem() {
        
        title = "Карточки"
        guard let image = UIImage(systemName: "checkmark") else {return}
        self.tabBarItem = UITabBarItem(title: "Карточки", image: image, tag: 1)
        
    }

}


// MARK: - UICollectionViewDataSource and UICollectionViewDelegate

extension CollectionViewController {
   
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return arrayOfCard.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CardCollectionViewCell
        card = arrayOfCard[indexPath.row]
        cell.imageView.image = UIImage(named: card.nameOfImage)
        
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        card = arrayOfCard[indexPath.row]
        let detailViewController = DetailViewController()
        detailViewController.card = card
        detailViewController.numberOfCard = indexPath.row
        let navVC = UINavigationController(rootViewController: detailViewController)
        present(navVC, animated: true)
        
    }
}
