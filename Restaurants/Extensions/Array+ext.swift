//
//  Array+ext.swift
//  Restaurants
//
//  Created by Павел Дубинин on 04.11.2023.
//

import UIKit

extension Array {
    
    func removeConstraints() {
        self.forEach {
            ($0 as? UIView)?.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}
