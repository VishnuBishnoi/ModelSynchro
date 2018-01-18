//
//  ApplicationEventProvider.swift
//  HybridNativeReactMVVM
//
//  Created by Jonathan Samudio on 1/16/18.
//  Copyright © 2018 Jonathan Samudio. All rights reserved.
//

import Foundation

struct ApplicationEventProvider {

    static func applicationEvents() -> [String]! {
        return [ListEventSender.reloadDataSource.rawValue,
                ListEventSender.updateButtonTitle.rawValue,
                DetailEventSender.loadBooks.rawValue,
                DetailEventSender.cellTapped.rawValue,
                BookDetailEventSender.loadData.rawValue]
    }
}
