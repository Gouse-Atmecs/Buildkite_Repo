//
//  ProductDetailsTests.swift
//  MyDemoAppUITests
//
//  Created by Sreenath Mudigonda on 02/12/24.
//

import XCTest

final class ProductDetailsTests: BaseTest{
    
    var homeScreen : HomeScreen!
    var productDetailScreen : ProductDetailScreen!
    
    override func setUp() {
        super.setUp()
        loadScreens()
    }
    
    func loadScreens(){
        homeScreen = HomeScreen(app: app)
        productDetailScreen = ProductDetailScreen(app: app)
    }

    func testSmokeProductDetails(){
       //logTestCategory()
       //Helpers.runIfTagged(with: ["Smoke"]) {
          let productNameInHome: String  = homeScreen.getProductName()
          let productCostInHome: String = homeScreen.getProductPrice()
          homeScreen.tapOnProduct(index: 0)
          let productNameInDetails: String  = productDetailScreen.getProductName()
          let productCostInDetails: String = productDetailScreen.getProductPrice()
          VerificationManager.validateTrue(for: productNameInHome == productNameInDetails)
          VerificationManager.validateTrue(for: productCostInHome == productCostInDetails)
          productDetailScreen.tapOnBackButton()
       //}
    }

}
