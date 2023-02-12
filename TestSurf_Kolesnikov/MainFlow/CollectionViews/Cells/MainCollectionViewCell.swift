//
//  MainCollectionViewCell.swift
//  TestSurf_Kolesnikov
//
//  Created by Sergey Kolesnikov on 07.02.2023.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Constants
    
    private enum Constants {
        static let notPressedBackgroundColor = UIColor(red: 243, green: 243, blue: 245, alfa: 1)
        static let notPressedTextColor = UIColor(red: 49, green: 49, blue: 49, alfa: 1)
        static let pressedBackgroundColor = UIColor(red: 49, green: 49, blue: 49, alfa: 1)
        static let pressedTextColor = UIColor(red: 255, green: 255, blue: 255, alfa: 1)
        
        static let mainLabelFont: CGFloat = 14
        static let cornerRadius: CGFloat = 12
    }
    
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
                backgroundColor = Constants.notPressedBackgroundColor
                mainLabel.textColor = Constants.notPressedTextColor
            } else {
                backgroundColor = Constants.pressedBackgroundColor
                mainLabel.textColor = Constants.pressedTextColor
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
        mainLabel.font = .systemFont(ofSize: Constants.mainLabelFont, weight: .medium)
        
        layer.cornerRadius = Constants.cornerRadius
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
                 contentView.leftAnchor.constraint(equalTo: leftAnchor),
                 contentView.rightAnchor.constraint(equalTo: rightAnchor),
                 contentView.topAnchor.constraint(equalTo: topAnchor),
                 contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
             ])
    }
}
