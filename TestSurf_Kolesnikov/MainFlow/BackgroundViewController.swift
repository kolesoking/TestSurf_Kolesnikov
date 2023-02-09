//
//  TryViewController.swift
//  TestSurf_Kolesnikov
//
//  Created by Sergey Kolesnikov on 08.02.2023.
//

import UIKit

class BackgroundViewController: UIViewController {
    
    // MARK: - Constants
    
    private enum Constants {
        
        // MARK: - ImageView

        static let topConstreintMainImage: CGFloat = -99
        static let leftConsnteintMainImage: CGFloat = -169
        static let righteConstreintMainImage: CGFloat = 169
        static let widthConstreintMainImage: CGFloat = 713
        static let heightConstreintMainImage: CGFloat = 713
        
        // MARK: - SheetPresentetionController
        
        static let sheetCornerRadius = 24
    }
    
    
    // MARK: - Views
    
    let mainImage: UIImageView = {
        let mainImage = UIImageView()
        mainImage.image = UIImage(named: "king")
        mainImage.contentMode = .scaleAspectFit
        return mainImage
    }()
    
    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureAppearance()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        presentMVC()
    }
}

// MARK: - PrivateMethods

private extension BackgroundViewController {
    
    func configureAppearance() {
        
        inicialize()
    }
    
    func inicialize() {
        
        view.backgroundColor = .white
        
        view.addSubview(mainImage)
        mainImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainImage.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.topConstreintMainImage),
            mainImage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: Constants.leftConsnteintMainImage),
            mainImage.rightAnchor.constraint(equalTo: view.rightAnchor, constant: Constants.righteConstreintMainImage),
            mainImage.widthAnchor.constraint(equalToConstant: Constants.widthConstreintMainImage),
            mainImage.heightAnchor.constraint(equalToConstant: Constants.heightConstreintMainImage)
        ])
    }
    
    @objc func presentMVC() {
        
        let mainVC = MainViewController()
        if let sheet = mainVC.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.preferredCornerRadius = 24
        }

        present(mainVC, animated: true)
    }
}
