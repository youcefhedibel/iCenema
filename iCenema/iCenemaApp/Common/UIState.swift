//
//  UIState.swift
//  iCenema
//
//  Created by mac on 10/12/2023.
//

import Foundation

enum UiState<Model> {
    case idle
    case loading
    case success(Model)
    case failed(String?)

    public var data: Model? {
        if case let .success(a) = self {
            return a
        } else {
            return nil
        }
    }
}
