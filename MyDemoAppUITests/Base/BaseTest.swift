//
//  BaseTest.swift
//  My Demo AppUITests
//
//  Created by Sreenath Mudigonda on 06/11/24.
//

import XCTest

class BaseTest: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        app = SessionManager().app
        SessionManager().startSession()
    }
    
    override func tearDown() {
        SessionManager().endSession()
         super.tearDown()
        TestLogger.shared.saveLogToFile()
        if let logFileURL = TestLogger.shared.getLogFileURL() {
            print("Log file URL: \(logFileURL.path)")
        }
    }
}

extension XCTestCase {
    
    // Check if the test belongs to the Sanity category
    var isSanity: Bool {
        return self.name.contains("Sanity")
    }

    // Check if the test belongs to the Regression category
    var isRegression: Bool {
        return self.name.contains("Regression")
    }

    // Check if the test belongs to the Smoke category
    var isSmoke: Bool {
        return self.name.contains("Smoke")
    }
    
    // Optionally, add a method to log the category of a test
    func logTestCategory() {
        if isSanity {
            print("This is a Sanity test: \(self.name)")
        } else if isRegression {
            print("This is a Regression test: \(self.name)")
        } else if isSmoke {
            print("This is a Smoke test: \(self.name)")
        } else {
            print("This test does not belong to any predefined category: \(self.name)")
        }
    }
}
