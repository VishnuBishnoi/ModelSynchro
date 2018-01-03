//
//  FakeModelDataSource.swift
//  ModelSynchroTests
//
//  Created by Jonathan Samudio on 1/3/18.
//  Copyright © 2018 Jonathan Samudio. All rights reserved.
//

import Foundation

class FakeModelDataSource: ModelDataSourceProtocol {

    var modelDict = [String : ModelGeneratorProtocol]()
    var fakeGenerator = FakeModelGenerator()

    var modelGeneratorWasCalled = false

    func modelGenerator(modelName: String) -> ModelGeneratorProtocol {
        modelGeneratorWasCalled = true
        modelDict[modelName] = fakeGenerator
        return fakeGenerator
    }
}
