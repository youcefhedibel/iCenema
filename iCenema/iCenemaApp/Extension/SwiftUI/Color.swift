//
//  Corlo.swift
//  iCenema
//
//  Created by youcef hedibel on 7/12/2023.
//

import Foundation
import SwiftUI

extension Color {
    static let primaryApp = Color(red: 40/255, green: 40/255, blue: 59/255)
    static let secondaryApp = Color(red: 92/255, green: 44/255, blue: 191/255)
    static let primaryText = Color(red: 247/255, green: 248/255, blue: 254/255)
    static let textTitle = Color(red: 124/255, green: 124/255, blue: 124/255)
    static let secondaryText = Color(red: 130/255, green: 130/255, blue: 130/255)

}

extension LinearGradient {
    static var backGroundeLinearGradient: LinearGradient {
        LinearGradient(
            gradient: Gradient(colors: [
                Color(red: 39/255, green: 17/255, blue: 77/255),
                Color(red: 138/255, green: 87/255, blue: 228/255),
                Color(red: 81/255, green: 52/255, blue: 130/255)
            ]),
            startPoint: .bottomTrailing,
            endPoint: .topLeading
        )
    }
}
