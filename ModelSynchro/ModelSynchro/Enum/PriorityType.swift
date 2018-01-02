//
//  PriorityType.swift
//  ModelSynchro
//
//  Created by Jonathan Samudio on 11/30/17.
//  Copyright © 2017 Jonathan Samudio. All rights reserved.
//

import Foundation

enum PriorityType: Int {
    case bool
    case int
    case double
    
    func comparePriority(type: PriorityType, formatter: LanguageFormatter) -> String? {
        let typeArray = [self, type]
        return typeArray.sorted { $0.rawValue > $1.rawValue }.first?.toString(formatter: formatter)
    }
    
    func toString(formatter: LanguageFormatter) -> String {
        switch self {
        case .int:
            return Type.int.toString(formatter: formatter)
        case .bool:
            return Type.bool.toString(formatter: formatter)
        case .double:
            return Type.double.toString(formatter: formatter)
        }
    }
    
    static func priorityType(rawValue: String) -> PriorityType? {
        switch rawValue {
        case "Bool":
            return .bool
        case "Int":
            return .int
        case "Double":
            return .double
        default:
            return nil
        }
    }
}
