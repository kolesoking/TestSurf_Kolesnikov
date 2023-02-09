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
        mainLabel.textColor = UIColor(red: 49 / 255, green: 49 / 255, blue: 49 / 255, alpha: 1)
        
        backgroundColor = UIColor(red: 243 / 255, green: 243 / 255, blue: 245 / 255, alpha: 1)
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
                 contentView.leftAnchor.constraint(equalTo: leftAnchor),
                 contentView.rightAnchor.constraint(equalTo: rightAnchor),
                 contentView.topAnchor.constraint(equalTo: topAnchor),
                 contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
             ])
    }
}
