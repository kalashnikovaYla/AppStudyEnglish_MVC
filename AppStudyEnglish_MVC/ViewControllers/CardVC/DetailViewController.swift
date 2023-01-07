//
//  DetailViewController.swift
//  AppStudyEnglish_MVC
//
//  Created by sss on 07.01.2023.
//

import UIKit

final class DetailViewController: UIViewController {

    //MARK: - Properties
    
    var card: Card!
    var numberOfCard: Int!
    private let arrayOfCard = Card.arrayData
    lazy var countCard = arrayOfCard.count
    
    private var imageView: UIImageView!
    private var nextButton: UIButton!
    private var label: UILabel!
    private var backView: UIView!
    private var verticalStack: UIStackView!
    
    
    //MARK: - ViewController life cycle
    
    override func viewDidLoad() {
        
        createTitle()
        createView()
        createConstraint()
    }
    
    //MARK: - Methods
    
    private func createTitle() {
        
        view.backgroundColor = .white
        title = "Учим слово"
        navigationItem.largeTitleDisplayMode = .always
        
    }
    
    private func createView() {
        
        //Create imageView
        
        imageView = UIImageView()
        imageView.center = view.center
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: card.nameOfImage)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        //Create backView
        
        backView = UIView()
        backView.backgroundColor = .systemBlue
        //backView.alpha = 0.8
        backView.layer.cornerRadius = 50
        backView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backView)
        
        // Create label
        
        label = UILabel()
        label.text = card.wordInEnglish + " - " + card.transiateInRussian
        label.numberOfLines = 0
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 19, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        backView.addSubview(label)
    
       
        // Create rightBarButtonItem
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close,
                                                            target: self,
                                                            action: #selector(dissmissVC))
        
        
        // Create button for show a new card
        
        nextButton = UIButton(type: .roundedRect)
        
        nextButton.backgroundColor = .clear
        nextButton.setTitleColor(.darkGray, for: .normal)
        nextButton.setTitle("Следующая", for: .normal)
        
        nextButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        
        nextButton.addTarget(self,
                             action: #selector(showNextCard),
                             for: .touchUpInside)
        view.addSubview(nextButton)
        
        
        // If the card is the last one, hide the nextButton
        
        if numberOfCard >= countCard - 1 {
            nextButton.isHidden = true
        }
        
    }
    
    @objc func dissmissVC() {
        dismiss(animated: true)
    }
    
  
    @objc func showNextCard() {
        
        // If the card is the last one, hide the button
        
        if numberOfCard == countCard - 2 {
            nextButton.isHidden = true
        }
        
        // Show a new card
        
        if numberOfCard < countCard - 1 {
            
            numberOfCard += 1
            imageView.image = UIImage(named: arrayOfCard[numberOfCard].nameOfImage)
            label.text = arrayOfCard[numberOfCard].wordInEnglish + " - " + arrayOfCard[numberOfCard].transiateInRussian
            
        }
            
    }
    
    
    
// MARK: -  NSLayoutConstraint
    
    private func createConstraint() {
        
        NSLayoutConstraint.activate([
        
            //Constraint for imageView
            
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: CGFloat(view.bounds.height/7)),
            imageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 5/7, constant: 0),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor),
            
            // Constraint for backView
            
            backView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            backView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 7/8),
            backView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1/3),
            
            
            // Constraint for label
            
            label.widthAnchor.constraint(equalTo: backView.widthAnchor),
            label.topAnchor.constraint(equalTo: backView.topAnchor, constant: 20),
            label.centerXAnchor.constraint(equalTo: backView.centerXAnchor),
            label.heightAnchor.constraint(equalToConstant: 50),
            
            //  Constraint for button
            
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/3),
            nextButton.heightAnchor.constraint(equalToConstant: 45),
            nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30)
            
        ])
    
        
    }
}
