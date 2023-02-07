//
//  MainViewController.swift
//  TestSurf_Kolesnikov
//
//  Created by Sergey Kolesnikov on 07.02.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()

        configureAppearance()
    }
}

// MARK: - PrivateMethods

private extension MainViewController {
    
    func configureAppearance() {
        inicialize()
    }
    
    func inicialize() {
        view.backgroundColor = UIColor(red: 255 / 255, green: 255 / 255, blue: 255 / 255, alpha: 1)
        
        let headerLabel = UILabel()
        headerLabel.text = "Cтажировка в Surf"
        headerLabel.textColor = UIColor(red: 49 / 255, green: 49 / 255, blue: 49 / 255, alpha: 1)
        headerLabel.font = .systemFont(ofSize: 24)
        headerLabel.numberOfLines = 0
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(headerLabel)
        
        let discriptionLabel = UILabel()
        discriptionLabel.text = "Работай над реальными задачами под руководством опытного наставника и получи возможность стать частью команды мечты."
        discriptionLabel.textColor = UIColor(red: 150 / 255, green: 149 / 255, blue: 155 / 255, alpha: 1)
        discriptionLabel.font = .systemFont(ofSize: 14)
        discriptionLabel.numberOfLines = 0
        discriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(discriptionLabel)
        
//        let verticalCollectionView = UICollectionView()
        
        // TODO: -
        
        let secondDiscriptionLabel = UILabel()
        secondDiscriptionLabel.text = "Получай стипендию, выстраивай удобный график, работай на современном железе."
        secondDiscriptionLabel.textColor = UIColor(red: 150 / 255, green: 149 / 255, blue: 155 / 255, alpha: 1)
        secondDiscriptionLabel.font = .systemFont(ofSize: 14)
        secondDiscriptionLabel.numberOfLines = 0
        secondDiscriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(secondDiscriptionLabel)
        
//        let columnCollectionView = UICollectionView()
        
        let infoButton = UIButton(type: .system)
        infoButton.setTitle("Хочешь к нам?", for: .normal)
        infoButton.setTitleColor(UIColor(red: 150 / 255, green: 149 / 255, blue: 155 / 255, alpha: 1), for: .normal)
        infoButton.titleLabel?.font = .systemFont(ofSize: 14)
        infoButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(infoButton)
        
        let sendButton = UIButton(type: .system)
        sendButton.setTitle("Отправить заявку", for: .normal)
        sendButton.setTitleColor(UIColor(red: 255 / 255, green: 255 / 255, blue: 255 / 255, alpha: 1), for: .normal)
        sendButton.titleLabel?.font = .systemFont(ofSize: 16)
        sendButton.backgroundColor = UIColor(red: 49 / 255, green: 49 / 255, blue: 49 / 255, alpha: 1)
        sendButton.layer.cornerRadius = 30
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        sendButton.addTarget(self, action: #selector(tapSendButton), for: .touchUpInside)
        view.addSubview(sendButton)
        
        
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            headerLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            headerLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
        ])
        
        NSLayoutConstraint.activate([
            discriptionLabel.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 12),
            discriptionLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            discriptionLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
        ])
        
        NSLayoutConstraint.activate([
            secondDiscriptionLabel.topAnchor.constraint(equalTo: discriptionLabel.bottomAnchor, constant: 12),
            secondDiscriptionLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            secondDiscriptionLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
        ])
        
        NSLayoutConstraint.activate([
            infoButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            infoButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            infoButton.heightAnchor.constraint(equalToConstant: 60),
            infoButton.rightAnchor.constraint(equalTo: sendButton.leftAnchor, constant: -24)
        ])
        
        NSLayoutConstraint.activate([
            sendButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            sendButton.leftAnchor.constraint(equalTo: infoButton.rightAnchor, constant: 24),
            sendButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            sendButton.heightAnchor.constraint(equalToConstant: 60),
            sendButton.widthAnchor.constraint(equalToConstant: 219)
        ])
    }
    
    @objc func tapSendButton() {
        // TODO: -
        print("Presed")
    }
}
