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
        var generatedLine = "\t"
        
        if let customLine = line.customProperty?.customLine {
            generatedLine += customLine + " // "
        }
        
        generatedLine += "let " + line.property.lowercaseFirstLetter() + ": " + line.type + (line.isOptional ? optional : "")
        
        return generatedLine
    }
    
    func property(variableString: String) -> String? {
        guard isVariable(variableString), let property = variableString.stringBetween(startString: "let", endString: ":") else {
            return nil
        }
        return property.trimmingCharacters(in: .whitespaces)
    }
    
    func keyMapping(lines: [Line]) -> String {
        guard !lines.isEmpty else {
            return ""
        }
        
        var keyMappingStrings = [String]()
        
        keyMappingStrings.append("\n\tenum CodingKeys: String, CodingKey {")
        
        for line in lines {
            let keyedProperty = (line.customProperty?.keyedProperty?.mappedProperty ?? line.property).lowercaseFirstLetter()
            let jsonProperty = (line.customProperty?.keyedProperty?.jsonProperty ?? line.property).lowercaseFirstLetter()
            keyMappingStrings.append("\t\tcase " + keyedProperty + " = \"" + jsonProperty + "\"")
        }
        
        keyMappingStrings.append("\t}")
        return keyMappingStrings.joined(separator: "\n")
    }
    
    func isVariable(_ string: String) -> Bool {
        return string.contains("let") && string.contains(":")
    }
    
    func keyedProperty(string: String) -> KeyedProperty? {
        if string.contains("case"), let splitString = string.split(at: "=") {
            let mappedProperty = splitString.leftString.removeLeading(startWith: "case").trimmingCharacters(in: .whitespaces)
            let jsonProperty = splitString.rightString.trimmingCharacters(in: .whitespaces).replacingOccurrences(of: "\"", with: "")
            return KeyedProperty(mappedProperty: mappedProperty, jsonProperty: jsonProperty)
        }
        return nil
    }
}
