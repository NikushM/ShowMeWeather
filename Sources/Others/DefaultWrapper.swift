//
//  DefaultWrapper.swift
//  ShowMeWeather
//
//  Created by Nikush on 12.03.2025.
//

import Foundation

@propertyWrapper struct DefaultWrapper<T> {
    let key : String
    var wrappedValue: T {
        didSet{
            UserDefaults.standard.set(wrappedValue, forKey: key)
}
}
    init(wrappedValue: T, key: String) {
        self.key = key
        self.wrappedValue = UserDefaults.standard.value(forKey: key) as? T ?? wrappedValue
    }
}
