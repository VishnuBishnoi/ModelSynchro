//
//  SwiftLanguageFormatter.swift
//  ModelSynchro
//
//  Created by Jonathan Samudio on 11/28/17.
//  Copyright © 2017 Jonathan Samudio. All rights reserved.
//

import Foundation

final class SwiftLanguageFormatter: LanguageFormatter {
    
    var fileExtension: String {
        return ".swift"
    }
    
    var optional: String {
        return "?"
    }
    
    var modelClassEndLine: String {
        return "}"
    }
    
    var typeSeparator: String {
        return ":"
    }
    
    var lineComment: String {
        return "//"
    }
    
    func fileHeader(name: String, config: ConfigurationFile) -> String {
        return """
        //
        //  \(name).swift
        //  \(config.projectName)
        //
        //  Created by \(config.authorName) on \(Date.currentDateString).
        //  Copyright © \(Date.currentYearString) \(config.companyName). All rights reserved.
        //
        
        /*
            Auto-Generated using ModelSynchro
        */
        
        """
    }
    
    func modelClassDeclaration(name: String) -> String {
        return "struct " + name + ": Codable {"
    }
    
    func variableString(line: Line) -> String {
        var generatedLine = "\tlet " + line.property.lowercaseFirstLetter() + ": " + line.type + (line.isOptional ? optional : "")
        
        if let customLine = line.customLine {
            generatedLine = customLine + "// " + generatedLine
        }
        return generatedLine
    }
}
