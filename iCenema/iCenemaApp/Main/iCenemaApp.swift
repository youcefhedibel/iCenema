//
//  iCenemaApp.swift
//  iCenema
//
//  Created by youcef hedibel on 10/12/2023.
//

import SwiftUI

@main
struct iCenemaApp: App {
    
    init() {
            let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.backgroundColor =  UIColor(Color.primaryApp)
            navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
            navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.black]
          }
    
    var body: some Scene {
        WindowGroup {
            TrendingMoviesScreen()
        }
    }
}
