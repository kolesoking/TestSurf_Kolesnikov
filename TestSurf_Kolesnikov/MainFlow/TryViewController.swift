//
//  TryViewController.swift
//  TestSurf_Kolesnikov
//
//  Created by Sergey Kolesnikov on 08.02.2023.
//

import UIKit

class TryViewController: UIViewController {
    
    let mainImage: UIImageView = {
        let mainImage = UIImageView()
        mainImage.image = UIImage(named: "king")
        mainImage.contentMode = .scaleAspectFit
        return mainImage
    }()

    override func viewDidLoad() {
        super.viewDidLoad() 
        
        view.addSubview(mainImage)
        mainImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainImage.topAnchor.constraint(equalTo: view.topAnchor, constant: -99),
            mainImage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: -169),
            mainImage.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 169),
            mainImage.widthAnchor.constraint(equalToConstant: 713),
            mainImage.heightAnchor.constraint(equalToConstant: 713)
        ])

        view.backgroundColor = .white
    }
    
    override func viewDidAppear(_ animated: Bool) {
        presentMVC()
    }
    
    @objc func presentMVC() {
        let mvc = MainViewController()
        if let sheet = mvc.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.preferredCornerRadius = 24

        }

        present(mvc, animated: true)
        print("gg")
    }

}
