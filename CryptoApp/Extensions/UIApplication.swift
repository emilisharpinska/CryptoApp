//
//  UIApplication.swift
//  CryptoApp
//
//  Created by Emili Sharpinska on 18/07/2026.
//

import Foundation
import SwiftUI

//Dismiss keybord func

extension UIApplication {
    func endEditing(){
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
