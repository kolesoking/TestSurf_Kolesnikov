//
//  MainViewController.swift
//  TestSurf_Kolesnikov
//
//  Created by Sergey Kolesnikov on 07.02.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Constants
    
    private enum Constants {
        
        static let topConstreintForTitleView: CGFloat = 24
        static let leftConstreintForViews: CGFloat = 20
        static let rightConstreintForViews: CGFloat = -20
        static let topIntervalConstreintForView: CGFloat = 12
        static let bottomIntervalConstreintForView: CGFloat = -12
        
        
        static let heightVerticalCV: CGFloat = 44
        
        static let heightCell: CGFloat = 44
        static let widthCell: CGFloat = 0
        
        static let heightButtom: CGFloat = 60
        static let widthSendButtom: CGFloat = 219
        
        static let fontSizeHeaderLabel: CGFloat = 24
        static let fontSizeDiscriptionLabel: CGFloat = 14
        static let fontSizeInfoButtom: CGFloat = 14
        static let fontSizeSendButtom: CGFloat = 16
        
        static let cornerRadiusSendButton: CGFloat = 30
        
        static let textHeaderLabel = "Cтажировка в Surf"
        static let textDiscriptionLabel = "Работай над реальными задачами под руководством опытного наставника и получи возможность стать частью команды мечты."
        static let textSecondDiscriptionLabel = "Получай стипендию, выстраивай удобный график, работай на современном железе."
        static let textInfoButtom = "Хочешь к нам?"
        static let textSendButtom = "Отправить заявку"
        static let textAlertTitle = "Поздравляем!"
        static let textAlertMessage = "Ваша заявка успешно отправлена!"
        static let textAlertCancelButtom = "Закрыть"
        
    }
    
    // MARK: - Views

    private var verticalCollectionView: UICollectionView!
    private var columnCollectionView: UICollectionView!
    
    // MARK: - PrivateProperties
    
    var courses: [CourseModel] = CourseModel.getCourses()
    var colomnCources: [CourseModel] = CourseModel.getCourses()
    
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
        headerLabel.text = Constants.textHeaderLabel
        headerLabel.textColor = UIColor(red: 49 / 255, green: 49 / 255, blue: 49 / 255, alpha: 1)
        headerLabel.font = .systemFont(ofSize: Constants.fontSizeHeaderLabel, weight: .medium)
        headerLabel.numberOfLines = 0
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(headerLabel)
        
        let discriptionLabel = UILabel()
        discriptionLabel.text = Constants.textDiscriptionLabel
        discriptionLabel.textColor = UIColor(red: 150 / 255, green: 149 / 255, blue: 155 / 255, alpha: 1)
        discriptionLabel.font = .systemFont(ofSize: Constants.fontSizeDiscriptionLabel)
        discriptionLabel.numberOfLines = 0
        discriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(discriptionLabel)
        
        let secondDiscriptionLabel = UILabel()
        secondDiscriptionLabel.text = Constants.textSecondDiscriptionLabel
        secondDiscriptionLabel.textColor = UIColor(red: 150 / 255, green: 149 / 255, blue: 155 / 255, alpha: 1)
        secondDiscriptionLabel.font = .systemFont(ofSize: Constants.fontSizeDiscriptionLabel)
        secondDiscriptionLabel.numberOfLines = 0
        secondDiscriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(secondDiscriptionLabel)
        
        let infoButton = UIButton(type: .system)
        infoButton.setTitle(Constants.textInfoButtom, for: .normal)
        infoButton.setTitleColor(UIColor(red: 150 / 255, green: 149 / 255, blue: 155 / 255, alpha: 1), for: .normal)
        infoButton.titleLabel?.font = .systemFont(ofSize: Constants.fontSizeInfoButtom)
        infoButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(infoButton)
        
        let sendButton = UIButton(type: .system)
        sendButton.setTitle(Constants.textSendButtom, for: .normal)
        sendButton.setTitleColor(UIColor(red: 255 / 255, green: 255 / 255, blue: 255 / 255, alpha: 1), for: .normal)
        sendButton.titleLabel?.font = .systemFont(ofSize: Constants.fontSizeSendButtom)
        sendButton.backgroundColor = UIColor(red: 49 / 255, green: 49 / 255, blue: 49 / 255, alpha: 1)
        sendButton.layer.cornerRadius = Constants.cornerRadiusSendButton
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
        verticalCollectionView.backgroundColor = UIColor(red: 255 / 255, green: 255 / 255, blue: 255 / 255, alpha: 1)
        verticalCollectionView.register(UINib(nibName: "\(MainCollectionViewCell.self)", bundle: .main), forCellWithReuseIdentifier: "\(MainCollectionViewCell.self)")
        view.addSubview(verticalCollectionView)
        
        let columnLayout = UICollectionViewFlowLayout()
        columnLayout.scrollDirection = .vertical
        columnLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        
        
        columnCollectionView = UICollectionView(frame: .zero, collectionViewLayout: columnLayout)
        columnCollectionView.showsHorizontalScrollIndicator = false
        columnCollectionView.delegate = self
        columnCollectionView.dataSource = self
        columnCollectionView.translatesAutoresizingMaskIntoConstraints = false
        columnCollectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 20)
        columnCollectionView.backgroundColor = UIColor(red: 255 / 255, green: 255 / 255, blue: 255 / 255, alpha: 1)
        columnCollectionView.register(UINib(nibName: "\(MainCollectionViewCell.self)", bundle: .main), forCellWithReuseIdentifier: "\(MainCollectionViewCell.self)")
        view.addSubview(columnCollectionView)
        
        
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Constants.topConstreintForTitleView),
            headerLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: Constants.leftConstreintForViews),
            headerLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: Constants.rightConstreintForViews),
        ])
        
        NSLayoutConstraint.activate([
            discriptionLabel.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: Constants.topIntervalConstreintForView),
            discriptionLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: Constants.leftConstreintForViews),
            discriptionLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: Constants.rightConstreintForViews),
        ])
        
        NSLayoutConstraint.activate([
            verticalCollectionView.topAnchor.constraint(equalTo: discriptionLabel.bottomAnchor, constant: Constants.topIntervalConstreintForView),
            verticalCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            verticalCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            verticalCollectionView.bottomAnchor.constraint(equalTo: secondDiscriptionLabel.topAnchor, constant: Constants.bottomIntervalConstreintForView),
            verticalCollectionView.heightAnchor.constraint(equalToConstant: Constants.heightVerticalCV)
        ])
        
        NSLayoutConstraint.activate([
            secondDiscriptionLabel.topAnchor.constraint(equalTo: verticalCollectionView.bottomAnchor, constant: Constants.topIntervalConstreintForView),
            secondDiscriptionLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: Constants.leftConstreintForViews),
            secondDiscriptionLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: Constants.rightConstreintForViews),
        ])
        
        NSLayoutConstraint.activate([
            columnCollectionView.topAnchor.constraint(equalTo: secondDiscriptionLabel.bottomAnchor, constant: Constants.topIntervalConstreintForView),
            columnCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: Constants.leftConstreintForViews),
            columnCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            columnCollectionView.bottomAnchor.constraint(equalTo: infoButton.topAnchor)
        ])
        
        NSLayoutConstraint.activate([
            infoButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: Constants.leftConstreintForViews),
            infoButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            infoButton.heightAnchor.constraint(equalToConstant: Constants.heightButtom),
            
        ])
        
        NSLayoutConstraint.activate([
            sendButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: Constants.rightConstreintForViews),
            sendButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            sendButton.heightAnchor.constraint(equalToConstant: Constants.heightButtom),
            sendButton.widthAnchor.constraint(equalToConstant: Constants.widthSendButtom)
        ])
    }
    
    @objc func showAlert() {
        let alert = UIAlertController(
            title: Constants.textAlertTitle,
            message: Constants.textAlertMessage,
            preferredStyle: .alert
        )
        
        let cancel = UIAlertAction(
            title: Constants.textAlertCancelButtom,
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
        switch collectionView {
        case verticalCollectionView:
            return courses.count
        default:
            return colomnCources.count
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = verticalCollectionView.dequeueReusableCell(withReuseIdentifier: "\(MainCollectionViewCell.self)", for: indexPath)
        guard let cell = cell as? MainCollectionViewCell else {
            return UICollectionViewCell()
        }
        switch collectionView {
        case verticalCollectionView:
            cell.textTitle = courses[indexPath.row].course
            cell.pressed = courses[indexPath.row].pressed
        default:
            cell.textTitle = colomnCources[indexPath.row].course
            cell.pressed = colomnCources[indexPath.row].pressed
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView {
        case verticalCollectionView:
            courses[indexPath.row].pressed.toggle()
        default:
            colomnCources[indexPath.row].pressed.toggle()
        }
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: Constants.widthCell, height: Constants.heightButtom)
    }
}


