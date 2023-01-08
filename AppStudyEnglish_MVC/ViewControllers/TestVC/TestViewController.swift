//
//  TestViewController.swift
//  AppStudyEnglish_MVC
//
//  Created by sss on 07.01.2023.
//

import UIKit

final class TestViewController: UIViewController {

    
    //MARK: - Properties
    
    var arrayOfCard = Card.arrayData
    var card: Card!
    
    private var firstButton: UIButton!
    private var secondButton: UIButton!
    private var thirdButton: UIButton!
    lazy var arrayButtons: [UIButton] = {
        return [firstButton,secondButton,thirdButton]
    }()
    
    var label: UILabel!
    var backView: UIView!
    
    private var numberOfTest = 0
    private var countOfRightAnswer = 0
    
    
   //MARK: - ViewController life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        card = arrayOfCard[0]
        
        createTabBarItem()
        createViews()
        createConstraint()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        numberOfTest = 0
        updateTest()
    }

    
    //MARK: - Method
    
    private func createTabBarItem() {
        
        title = "Тест"
        guard let image  = UIImage(systemName: "highlighter") else {return}
        self.tabBarItem = UITabBarItem(title: "Тест", image: image, tag: 2)
        
    }
    
    private func createButton() -> UIButton {
        
        let button = UIButton(type: .roundedRect)
        button.backgroundColor = .systemPurple
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.darkGray, for: .highlighted)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.layer.cornerRadius = 30
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addTarget(self,
                         action: #selector(buttonPressed),
                         for: .touchUpInside)
        return button
    }
    
    
    private func createViews() {
       
        // Create backView
        
        backView = UIView()
        backView.backgroundColor = .systemBlue
        backView.layer.cornerRadius = 50
        backView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backView)
        

        // Create label
        
        label = UILabel()
        label.text = card.transiateInRussian.capitalized
        label.numberOfLines = 0
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 19, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        backView.addSubview(label)
    
        
        // Create button
        
        firstButton = createButton()
        firstButton.tag = 0
        view.addSubview(firstButton)
        
        secondButton = createButton()
        secondButton.tag = 1
        view.addSubview(secondButton)
        
        thirdButton = createButton()
        thirdButton.tag = 2
        view.addSubview(thirdButton)
        
        for i in 0 ..< arrayButtons.count {
            
            let answer = card.answer
            arrayButtons[i].setTitle(answer[i], for: .normal)
        }
        
    
    }
    
    
    @objc func buttonPressed(_ sender: UIButton) {
        
        // Count right answer
        
        if sender.currentTitle == card.wordInEnglish {
            countOfRightAnswer += 1
        }
        
        // Increasing test number
        
        numberOfTest += 1
        guard numberOfTest != arrayOfCard.count else {
            numberOfTest = 0
            countOfRightAnswer = 0
            updateTest()
            return
        }
        updateTest()

    }
    
    private func updateTest() {
        
        // Update view elements for a new question
        
        if numberOfTest < arrayOfCard.count {
            
            card = arrayOfCard[numberOfTest]
            label.text = card.transiateInRussian.capitalized
            
            for i in 0 ..< arrayButtons.count {
                let answer = card.answer
                arrayButtons[i].setTitle(answer[i], for: .normal)
            }
        }
        
        // If the card is the last one, show a new view controller
        
        if numberOfTest == arrayOfCard.count - 1 {
            
            let resultViewController = ResultViewController()
            resultViewController.countOfRightAnswer = countOfRightAnswer
            resultViewController.navigationItem.largeTitleDisplayMode = .never
            navigationController?.pushViewController(resultViewController, animated: true)
            
        }
        
    }
    
    //MARK: - NSLayoutConstraint
    
    private func createConstraint() {
        
        NSLayoutConstraint.activate([
            
            backView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 3/5),
            backView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 3/4),
            backView.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height/5),
            backView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            label.centerXAnchor.constraint(equalTo: backView.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: backView.centerYAnchor),
            
            firstButton.topAnchor.constraint(equalTo: backView.bottomAnchor, constant: 20),
            firstButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            firstButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 2/3),
            firstButton.heightAnchor.constraint(equalToConstant: 60),
            
            secondButton.topAnchor.constraint(equalTo: firstButton.bottomAnchor, constant: 20),
            secondButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            secondButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 2/3),
            secondButton.heightAnchor.constraint(equalToConstant: 60),
            
            thirdButton.topAnchor.constraint(equalTo: secondButton.bottomAnchor, constant: 20),
            thirdButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            thirdButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 2/3),
            thirdButton.heightAnchor.constraint(equalToConstant: 60)
            
        ])
        
    }
   
}

