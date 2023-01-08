//
//  ResultViewController.swift
//  AppStudyEnglish_MVC
//
//  Created by sss on 07.01.2023.
//

import UIKit


final class ResultViewController: UIViewController {

    //MARK: - Properties
    
    lazy var arrayOfCard = Card.arrayData
    var countOfRightAnswer = 0
    
    var label: UILabel!
    var resultTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        settingsNavigationItem()
        createLabel()
        createConstraint()
    }
    
    //MARK: - Methods
    
    private func settingsNavigationItem() {
        
        title = "Результаты теста"
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close,
                                                            target: self,
                                                            action: #selector(dissmissVC))
        
    }
    
    private func createLabel() {
        
        label = UILabel(frame: CGRect(x: 0, y: 0, width: view.bounds.width - 20.0, height: 30))
        label.text = "Правильных ответов \(countOfRightAnswer) из 25"
        label.numberOfLines = 0
        label.textColor = .black
        label.textAlignment = .justified
        label.font = UIFont.systemFont(ofSize: 19, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        
    }
    
    private func createConstraint() {
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: view.bounds.height/4),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
    }
    
    @objc func dissmissVC() {
        navigationController?.popViewController(animated: true)
    }

}
