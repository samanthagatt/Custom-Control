//
//  PerformFlare.swift
//  Custom Control
//
//  Created by Samantha Gatt on 8/28/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

import UIKit

//extension UIView {
//    // "Flare view" animation sequence
//    func performFlare() {
//        func flare() {
//            transform = CGAffineTransform(scaleX: 1.6, y: 1.6)
//        }
//        func unflare() {
//            transform = .identity
//        }
//
//        UIView.animate(withDuration: 0.3,
//                       animations: { flare() },
//                       completion: { _ in
//                            UIView.animate(withDuration: 0.1, animations: { unflare() })
//        })
//    }
//}

extension UIView {
    // "Flare view" animation sequence
    func performFlare() {
        func flare()   { transform = CGAffineTransform(scaleX: 1.6, y: 1.6) }
        func unflare() { transform = .identity }
        
        UIView.animate(withDuration: 0.3,
                       animations: { flare() },
                       completion: { _ in UIView.animate(withDuration: 0.1) { unflare() }})
    }
}
