//
//  SanityTestCases.swift
//  MyDemoAppUITests
//
//  Created by Mohammad Gouse Jani on 03/01/25.
//

import XCTest

final class GroupedTestCases: BaseTest {

   let cartAndCheckoutFlowTests = CartAndCheckoutFlowTests()
   let loginScenarioTests = LoginScenarioTests()
   let logoutVerificationTests = LogoutVerificationTests()
   
//    func testSanityTestCases() {
//       cartAndCheckoutFlowTests.setUp()
//       loginScenarioTests.setUp()
//       cartAndCheckoutFlowTests.testSmokeMultipleItemsCheckOut()
//       loginScenarioTests.testSanityEmptyLogin()
//   }
//   
//   func testSmokeTestCases() {
//      cartAndCheckoutFlowTests.setUp()
//      loginScenarioTests.setUp()
//      cartAndCheckoutFlowTests.testSanityVerifyItemRemovalFromCart()
//      loginScenarioTests.testRegressionLoginAndItemPurchase()
//  }
//   
//   func testRegressionTestCases() {
//      cartAndCheckoutFlowTests.setUp()
//      logoutVerificationTests.setUp()
//      cartAndCheckoutFlowTests.testSmokeCheckOutWithEmptyCart()
//      cartAndCheckoutFlowTests.testRegressionAddRemoveItemsFromCart()
//      logoutVerificationTests.testRegressionLogoutFunctionality()
//  }
}
