//
//  CategoryTestRunner.swift
//  MyDemoAppUITests
//
//  Created by Mohammad Gouse Jani on 02/01/25.
//

import Foundation
import XCTest

class CategoryTestRunner: BaseTest {
   
   func testRunSanityTests() {
           // Create a custom test suite for all relevant classes
           let sanityTests = XCTestSuite.default
           // Run only tests containing "testSanity"
      TestCategoryRunner.runTests(for: "testSanity", in: sanityTests)
       }

    func testRunSmokeTests() {
        let allTests = XCTestSuite.default
       TestCategoryRunner.runTests(for: "testSmoke", in: allTests)
    }

    func testRunRegressionTests() {
        let allTests = XCTestSuite.default
       TestCategoryRunner.runTests(for: "testRegression", in: allTests)
    }
   
}
