//
//  ConfigurationParser.swift
//  ModelSynchro
//
//  Created by Jonathan Samudio on 11/27/17.
//  Copyright © 2017 Jonathan Samudio. All rights reserved.
//

import Foundation

final class ConfigurationParser {
    
    var configFile: ConfigurationFile?
    
    static var projectDirectory: String = ""
    
    init() {
    #if RELEASE
        let userDefaults = UserDefaults.standard.dictionaryRepresentation()
        guard let projectDirectory = userDefaults["projectDirectory"] as? String else {
            print("Error: Project Directory Not Found")
            return
        }
    #else
        guard let projectDirectory = ConfigurationParser.getEnvironmentVar("PROJECT_DIR") else {
            print("Error: Project Directory Not Found")
            return
        }
    #endif
        ConfigurationParser.projectDirectory = projectDirectory
        parseConfigurationFile(projectDirectory: projectDirectory)
    }
}

private extension ConfigurationParser {
  
    private static func getEnvironmentVar(_ name: String) -> String? {
        guard let rawValue = getenv(name) else { return nil }
        return String(utf8String: rawValue)
    }
    
    private func parseConfigurationFile(projectDirectory: String) {
        let fileToParse = projectDirectory + "configuration.json"
        
        do {
            let content = try String(contentsOfFile: fileToParse, encoding: String.Encoding.utf8)
            let fileLines = content.components(separatedBy: "\n")
            setupConfigurationFile(fileLines: fileLines)
        } catch {
            print("Error caught with message: \(error.localizedDescription)")
        }
    }
    
    private func setupConfigurationFile(fileLines: [String]) {
        let configString = fileLines.joined()
        let configData = configString.data(using: .utf8)
        configData?.deserializeObject(completion: { (config, _) in
            self.configFile = config
        })
    }
}
