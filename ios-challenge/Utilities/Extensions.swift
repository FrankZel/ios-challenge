//
//  Extensions.swift
//  ios-challenge
//
//  Created by Franco Zelener on 19/05/2024.
//

import Foundation

extension String {
    func toDouble() -> Double? {
        return NumberFormatter().number(from: self)?.doubleValue
    }
}
