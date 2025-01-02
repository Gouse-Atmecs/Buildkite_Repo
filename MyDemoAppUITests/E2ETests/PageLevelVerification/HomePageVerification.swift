//
//  HomePageVerification.swift
//  MyDemoAppUITests
//
//  Created by Mohammad Gouse Jani on 02/01/25.
//

import XCTest

final class HomePageVerification: BaseTest {
   var homeScreen : HomeScreen!
   
   func testHomePageVerification() {
      VerificationManager.validateTrue(for: homeScreen.isProductNameVisible())
      VerificationManager.validateTrue(for: homeScreen.isProductImageVisible())
      VerificationManager.validateTrue(for: homeScreen.isProductProductCostVisible())
   }
   
}
