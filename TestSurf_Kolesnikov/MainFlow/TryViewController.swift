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
        mainImage.contentMode = .bottom
        return mainImage
    }()

    let button: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .green
        button.setTitle("XXX", for: .normal)
        button.setTitleColor(.red, for: .normal)
        return button
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(button)
        view.addSubview(mainImage)
        button.addTarget(self, action: #selector(presentMVC), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.leftAnchor.constraint(equalTo: view.leftAnchor),
            button.topAnchor.constraint(equalTo: view.topAnchor, constant: 40)
        ])
        
        mainImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainImage.topAnchor.constraint(equalTo: view.topAnchor, constant: -99),
            mainImage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: -169),
            mainImage.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 169),
            mainImage.widthAnchor.constraint(equalToConstant: 713),
            mainImage.heightAnchor.constraint(equalToConstant: 713)
        ])
        
        presentMVC()
        
        view.backgroundColor = .red
    }
    
    @objc func presentMVC() {
        let mvc = MainViewController()
        if let sheet = mvc.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.preferredCornerRadius = 24
        }
        show(mvc, sender: self)
        print("gg")
    }

}
