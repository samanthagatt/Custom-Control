//
//  CustomControl.swift
//  Custom Control
//
//  Created by Samantha Gatt on 8/28/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
    
    // XCode suggested required (not mentioned in instructions)
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        
        setup()
    }
    
    // MARK: - Properties
    
    var value: Int = 1
    
    private let componentDimension: CGFloat = 40.0
    private let componentCount = 5
    private let componentActiveColor = UIColor.black
    private let componentInactiveColor = UIColor.gray
    private let componentPadding: CGFloat = 8.0
    
    
    // MARK: - Private functions
    
    private func setup() {
        
        var labelArray: [UILabel] = []
        var x: CGFloat = 0.0
        for int in 1...5 {
            let label = UILabel(frame: CGRect(x: x, y: 0, width: componentDimension, height: componentDimension))
            label.tag = int
            label.font = UIFont.boldSystemFont(ofSize: 32.0)
            label.text = "✯"
            label.textAlignment = .center
            if int == 1 {
                label.textColor = componentActiveColor
            } else {
                label.textColor = componentInactiveColor
            }
            
            self.addSubview(label)
            labelArray.append(label)
            x += componentDimension + componentPadding
        }
        
        print(labelArray.count)
    }
    
    private func updateValue(at touch: UITouch) {
        
    }
    
    
    // MARK: - Size of view
    
    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * componentDimension
        let componentsSpacing = CGFloat(componentCount + 1) * 8.0
        let width = componentsWidth + componentsSpacing
        return CGSize(width: width, height: componentDimension)
    }
    
    
    // MARK: - Touch tracking
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        updateValue(at: touch)
        sendActions(for: [.touchDown, .valueChanged])
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            updateValue(at: touch)
            sendActions(for: [.touchDragInside, .valueChanged])
        } else {
            sendActions(for: [.touchDragOutside])
        }
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        defer { super.endTracking(touch, with: event)}
        
        guard let touch = touch else { return }
        
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            updateValue(at: touch)
            sendActions(for: [.touchUpInside, .valueChanged])
        } else {
            sendActions(for: [.touchUpOutside])
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: [.touchCancel])
    }
}
