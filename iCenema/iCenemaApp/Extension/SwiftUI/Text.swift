//
//  Text.swift
//  iCenema
//
//  Created by youcef hedibel on 7/12/2023.
//

import Foundation
import SwiftUI

extension Text {
    
    func font(_ color: Color, _ GrocefyFont: Font.GroceryNotoSans, _ size: CGFloat) -> Text {
        switch GrocefyFont {
        case .regular:
            return self.font(.custom(Font.GroceryNotoSans.regular.rawValue, size: size)).foregroundColor(color)
        case .medium:
            return self.font(.custom(Font.GroceryNotoSans.medium.rawValue, size: size)).foregroundColor(color)
        case .semiBold:
            return self.font(.custom(Font.GroceryNotoSans.semiBold.rawValue, size: size)).foregroundColor(color)
        case .bold:
            return self.font(.custom(Font.GroceryNotoSans.bold.rawValue, size: size)).foregroundColor(color)
        }
    }
    
}
