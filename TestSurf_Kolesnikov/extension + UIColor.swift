//
//  extention + UIColor.swift
//  TestSurf_Kolesnikov
//
//  Created by Sergey Kolesnikov on 09.02.2023.
//

import Foundation
import UIKit

extension UIColor {
    
    convenience init(red: CGFloat, green: CGFloat, blue: CGFloat, alfa: CGFloat) {
        self.init(red: red / 255.0, green: green / 255.0, blue: blue / 255.0, alpha: alfa)
    }
}
