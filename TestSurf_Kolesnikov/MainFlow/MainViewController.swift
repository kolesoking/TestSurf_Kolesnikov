//
//  MainViewController.swift
//  TestSurf_Kolesnikov
//
//  Created by Sergey Kolesnikov on 07.02.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Views

    private var verticalCollectionView: UICollectionView!
    private var columnCollectionView: UICollectionView!
    
    // MARK: - PrivateProperties
    
    let courses: [CourseModel] = CourseModel.getCourses()
    
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
        presentationConfigure()
    }
    
    func inicialize() {
        view.backgroundColor = UIColor(red: 255 / 255, green: 255 / 255, blue: 255 / 255, alpha: 1)
        
        let headerLabel = UILabel()
        headerLabel.text = "Cтажировка в Surf"
        headerLabel.textColor = UIColor(red: 49 / 255, green: 49 / 255, blue: 49 / 255, alpha: 1)
        headerLabel.font = .systemFont(ofSize: 24, weight: .medium)
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
        
        let secondDiscriptionLabel = UILabel()
        secondDiscriptionLabel.text = "Получай стипендию, выстраивай удобный график, работай на современном железе."
        secondDiscriptionLabel.textColor = UIColor(red: 150 / 255, green: 149 / 255, blue: 155 / 255, alpha: 1)
        secondDiscriptionLabel.font = .systemFont(ofSize: 14)
        secondDiscriptionLabel.numberOfLines = 0
        secondDiscriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(secondDiscriptionLabel)
        
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
        sendButton.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        view.addSubview(sendButton)
        
        let verticalLayout = UICollectionViewFlowLayout()
        verticalLayout.scrollDirection = .horizontal
        verticalLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        
        verticalCollectionView = UICollectionView(frame: .zero, collectionViewLayout: verticalLayout)
        verticalCollectionView.showsHorizontalScrollIndicator = false
        verticalCollectionView.delegate = self
        verticalCollectionView.dataSource = self
        verticalCollectionView.translatesAutoresizingMaskIntoConstraints = false
        verticalCollectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        verticalCollectionView.register(UINib(nibName: "\(MainCollectionViewCell.self)", bundle: .main), forCellWithReuseIdentifier: "\(MainCollectionViewCell.self)")
        view.addSubview(verticalCollectionView)
        
        let columnLayout = UICollectionViewFlowLayout()
        columnLayout.scrollDirection = .vertical
        columnLayout.minimumLineSpacing = 12
        columnLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        columnLayout.minimumInteritemSpacing = 12
        
        columnCollectionView = UICollectionView(frame: .zero, collectionViewLayout: columnLayout)
        columnCollectionView.showsHorizontalScrollIndicator = false
        columnCollectionView.delegate = self
        columnCollectionView.dataSource = self
        columnCollectionView.translatesAutoresizingMaskIntoConstraints = false
        columnCollectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 20)
        columnCollectionView.register(UINib(nibName: "\(MainCollectionViewCell.self)", bundle: .main), forCellWithReuseIdentifier: "\(MainCollectionViewCell.self)")
        view.addSubview(columnCollectionView)
//        columnCollectionView.contentMode = .scaleAspectFit
        
        
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
            verticalCollectionView.topAnchor.constraint(equalTo: discriptionLabel.bottomAnchor, constant: 12),
            verticalCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            verticalCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            verticalCollectionView.bottomAnchor.constraint(equalTo: secondDiscriptionLabel.topAnchor, constant: -12),
            verticalCollectionView.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        NSLayoutConstraint.activate([
            secondDiscriptionLabel.topAnchor.constraint(equalTo: verticalCollectionView.bottomAnchor, constant: 12),
            secondDiscriptionLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            secondDiscriptionLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
        ])
        
        NSLayoutConstraint.activate([
            columnCollectionView.topAnchor.constraint(equalTo: secondDiscriptionLabel.bottomAnchor, constant: 12),
            columnCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            columnCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            columnCollectionView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            infoButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            infoButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            infoButton.heightAnchor.constraint(equalToConstant: 60),
            //            infoButton.rightAnchor.constraint(equalTo: sendButton.leftAnchor, constant: -24)
        ])
        
        NSLayoutConstraint.activate([
            sendButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            //            sendButton.leftAnchor.constraint(equalTo: infoButton.rightAnchor, constant: 24),
            sendButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            sendButton.heightAnchor.constraint(equalToConstant: 60),
            sendButton.widthAnchor.constraint(equalToConstant: 219)
        ])
    }
    
    @objc func showAlert() {
        let alert = UIAlertController(
            title: "Поздравляем!",
            message: "Ваша заявка успешно отправлена!",
            preferredStyle: .alert
        )
        
        let cancel = UIAlertAction(
            title: "Закрыть",
            style: .destructive
        )
        
        alert.addAction(cancel)
        
        present(alert, animated: true)
    }
}

// MARK: - UIAdaptivePresentationControllerDelegate

extension MainViewController: UIAdaptivePresentationControllerDelegate {
    func presentationConfigure() {
        presentationController?.delegate = self
        isModalInPresentation = true
    }
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegateFlowLayout

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return courses.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = verticalCollectionView.dequeueReusableCell(withReuseIdentifier: "\(MainCollectionViewCell.self)", for: indexPath)
        guard let cell = cell as? MainCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.textTitle = courses[indexPath.row].course
        cell.layer.cornerRadius = 12
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 0, height: 44)
    }
}


