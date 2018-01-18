//
//  RNViewType.swift
//  HybridNativeReactMVVM
//
//  Created by Jonathan Samudio on 1/12/18.
//  Copyright © 2018 Jonathan Samudio. All rights reserved.
//

import Foundation
import React

enum RNViewType: String {
    case blueButton
}

extension RNViewType {

    func loadView(properties: [String : Any]) -> UIView? {
        let delegate = (UIApplication.shared.delegate as? AppDelegate)
        guard let bridge = delegate?.bridge,
            let view = RCTRootView(bridge: bridge, moduleName: moduleName(), initialProperties: [:]) else {
            return nil
        }
        return view
    }

    private func moduleName() -> String {
        switch self {
        case .blueButton:
            return "BlueButton"
        }
    }
}
