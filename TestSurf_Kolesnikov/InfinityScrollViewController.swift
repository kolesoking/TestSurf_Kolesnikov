//
//  InfinityScrollViewController.swift
//  TestSurf_Kolesnikov
//
//  Created by Sergey Kolesnikov on 11.02.2023.
//

import UIKit

class InfinityScrollViewController: UIViewController {
    
    private enum Constants {
        
        static let heightVerticalCV: CGFloat = 44

        static let topContentInsetVerticalCV: CGFloat = 0
        static let leftContentInsetVerticalCV: CGFloat = 20
        static let bottomContentInsetVerticalCV: CGFloat = 0
        static let rightContentInsetVerticalCV: CGFloat = 20
        
        static let topContentInsetColumnCV: CGFloat = 0
        static let leftContentInsetColumnCV: CGFloat = 0
        static let bottomContentInsetColumnCV: CGFloat = 0
        static let rightContentInsetColumnCV: CGFloat = 20
        
        static let heightCell: CGFloat = 44
        static let widthCell: CGFloat = 0
        
        static let heightButtom: CGFloat = 60
        static let widthSendButtom: CGFloat = 219
        
        static let fontSizeHeaderLabel: CGFloat = 24
        static let fontSizeDiscriptionLabel: CGFloat = 14
        static let fontSizeInfoButtom: CGFloat = 14
        static let fontSizeSendButtom: CGFloat = 16
        
        static let cornerRadiusSendButton: CGFloat = 30
        
        static let viewBackgroundColor = UIColor(red: 255, green: 255, blue: 255, alfa: 1)
        static let headerLabelTextColor = UIColor(red: 49, green: 49, blue: 49, alfa: 1)
        static let discriptionLabelTextColor = UIColor(red: 150, green: 149, blue: 155, alfa: 1)
        static let secondDiscriptionLabelTextColor = UIColor(red: 150, green: 149, blue: 155, alfa: 1)
        static let infoButtonTitleColor = UIColor(red: 150, green: 149, blue: 155, alfa: 1)
        static let sendButtonTitleColor = UIColor(red: 255, green: 255, blue: 255, alfa: 1)
        static let sendButtonBackgroundColor = UIColor(red: 49, green: 49, blue: 49, alfa: 1)
        static let verticalCVBackgroundColor = UIColor(red: 255, green: 255, blue: 255, alfa: 1)
        static let columnCVBackgroundColor = UIColor(red: 255, green: 255, blue: 255, alfa: 1)
        
        
        static let textHeaderLabel = "Cтажировка в Surf"
        static let textDiscriptionLabel = "Работай над реальными задачами под руководством опытного наставника и получи возможность стать частью команды мечты."
        static let textSecondDiscriptionLabel = "Получай стипендию, выстраивай удобный график, работай на современном железе."
        static let textInfoButtom = "Хочешь к нам?"
        static let textSendButtom = "Отправить заявку"
        static let textAlertTitle = "Поздравляем!"
        static let textAlertMessage = "Ваша заявка успешно отправлена!"
        static let textAlertCancelButtom = "Закрыть"
        
    }
    
    private var verticalCollectionView: UICollectionView!
    
    private var courses: [CourseModel] = CourseModel.getCourses()

    override func viewDidLoad() {
        super.viewDidLoad()

        let verticalLayout = UICollectionViewFlowLayout()
        verticalLayout.scrollDirection = .horizontal
        verticalLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        
        verticalCollectionView = UICollectionView(frame: .zero, collectionViewLayout: verticalLayout)
        verticalCollectionView.showsHorizontalScrollIndicator = false
        verticalCollectionView.delegate = self
        verticalCollectionView.dataSource = self
        verticalCollectionView.translatesAutoresizingMaskIntoConstraints = false
        verticalCollectionView.contentInset = UIEdgeInsets(
            top: Constants.topContentInsetVerticalCV,
            left: Constants.leftContentInsetVerticalCV,
            bottom: Constants.bottomContentInsetVerticalCV,
            right: Constants.rightContentInsetVerticalCV)
        verticalCollectionView.backgroundColor = Constants.verticalCVBackgroundColor
        verticalCollectionView.register(UINib(nibName: "\(MainCollectionViewCell.self)", bundle: .main), forCellWithReuseIdentifier: "\(MainCollectionViewCell.self)")
        view.addSubview(verticalCollectionView)
        
        NSLayoutConstraint.activate([
            verticalCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12),
            verticalCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            verticalCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            verticalCollectionView.heightAnchor.constraint(equalToConstant: Constants.heightVerticalCV)
        ])
    }
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegateFlowLayout

extension InfinityScrollViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return courses.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = verticalCollectionView.dequeueReusableCell(withReuseIdentifier: "\(MainCollectionViewCell.self)", for: indexPath)
        guard let cell = cell as? MainCollectionViewCell else {
            return UICollectionViewCell()
        }

        cell.textTitle = courses[indexPath.row].course
        cell.pressed = courses[indexPath.row].pressed
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        courses[indexPath.row].pressed.toggle()
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: Constants.widthCell, height: Constants.heightButtom)
    }
}

