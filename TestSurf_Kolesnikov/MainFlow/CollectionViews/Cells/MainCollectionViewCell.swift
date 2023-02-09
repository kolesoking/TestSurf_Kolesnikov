//
//  MainCollectionViewCell.swift
//  TestSurf_Kolesnikov
//
//  Created by Sergey Kolesnikov on 07.02.2023.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Views
    
    @IBOutlet weak var mainLabel: UILabel!
    
    // MARK: - Properties
    
    var textTitle = "" {
        didSet {
            mainLabel.text = textTitle
        }
    }
    
    var pressed = false {
        didSet {
            if pressed == false {
                backgroundColor = UIColor(red: 243, green: 243, blue: 245, alfa: 1)
                mainLabel.textColor = UIColor(red: 49, green: 49, blue: 49, alfa: 1)
            } else {
                backgroundColor = UIColor(red: 49, green: 49, blue: 49, alfa: 1)
                mainLabel.textColor = UIColor(red: 255, green: 255, blue: 255, alfa: 1)
            }
        }
    }
    
    // MARK: - UICollectionViewCell
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureAppearance()
    }

}

// MARK: - PrivateMethods

private extension MainCollectionViewCell {
    func configureAppearance() {
        mainLabel.numberOfLines = 0
        mainLabel.font = .systemFont(ofSize: 14, weight: .medium)
        
        layer.cornerRadius = 12
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
                 contentView.leftAnchor.constraint(equalTo: leftAnchor),
                 contentView.rightAnchor.constraint(equalTo: rightAnchor),
                 contentView.topAnchor.constraint(equalTo: topAnchor),
                 contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
             ])
    }
}
