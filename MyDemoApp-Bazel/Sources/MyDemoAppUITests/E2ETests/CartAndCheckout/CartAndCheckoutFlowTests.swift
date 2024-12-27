//
//  CartAndCheckoutFlowTests.swift
//  MyDemoAppUITests
//
//  Created by Mohammad Gouse Jani on 04/12/24.
//

import XCTest

final class CartAndCheckoutFlowTests: BaseTest {
    var homeScreen : HomeScreen!
    var moreScreen : MoreScreen!
    var loginScreen : LoginScreen!
    var cartScreen : CartScreen!
    var shippingAddressScreen : ShippingAdressScreen!
    var checkOutScreen:CheckOutScreen!
    var placeOrderScreen:PlaceOrderScreen!
    var checkoutCompleteScreen : CheckoutCompleteScreen!
    var userCredentialsTestData: UserCredentialsTestDataModel!
    var userAddressTestData : UserAddressModel!
    var userCardDetailsTestData : UserCardDetailsModel!
    
    let firstItemIndex = 0
    let secondItemIndex = 1
    let thirdItemIndex = 2
    
    override func setUp() {
        super.setUp()
        loadScreens()
        loadTestData()
    }
    
    /// This method loads required screeens for the tests
    func loadScreens() {
        homeScreen = HomeScreen(app: app)
        moreScreen = MoreScreen(app: app)
        loginScreen = LoginScreen(app: app)
        cartScreen = CartScreen(app: app)
        shippingAddressScreen = ShippingAdressScreen(app: app)
        checkOutScreen = CheckOutScreen(app: app)
        placeOrderScreen = PlaceOrderScreen(app: app)
        checkoutCompleteScreen = CheckoutCompleteScreen(app: app)
    }
    
    /// This functions loads test data for the tests
    func loadTestData() {
        userCredentialsTestData = Helpers.loadTestData(from: AppConstants.LOGIN,ofType: UserCredentialsTestDataModel.self)
        userAddressTestData = Helpers.loadTestData(from: AppConstants.ADDRESS,ofType: UserAddressModel.self)
        userCardDetailsTestData = Helpers.loadTestData(from: AppConstants.CARD_DETAILS,ofType: UserCardDetailsModel.self)
    }
    
    func testMultipleItemsCheckOut() throws {
        TestLogger.shared.log("Test started: \(self.name)")
        /// Login
        homeScreen.tapOnMoreTab()
        moreScreen.tapOnLogin()
//        loginScreen.login(userName: userCredentialsTestData.validCredentials.userName ?? "", password: userCredentialsTestData.validCredentials.password ?? "")
        Helpers.loginWithRandomUser(on: loginScreen)
        homeScreen.tapOnMoreTab()
        ///Verify whether the user is logged in
        VerificationManager.validateTrue(for: moreScreen.checkForLogOut())
        ///Comes to dashboard screen
        homeScreen.tapOnCatalogTab()
        /// Add Multiple products to the cart
        let (procutName,productCost) = homeScreen.getItemDetails(at: firstItemIndex)
        homeScreen.addToCart(index: firstItemIndex)
        let productCostInCart: String = cartScreen.getProductPriceInString()
        let productNameInCart: String = cartScreen.getProductNameString()
        VerificationManager.validateTrue(for: procutName == productNameInCart)
        VerificationManager.validateTrue(for: productCost == productCostInCart)
        homeScreen.tapOnCatalogTab()
        homeScreen.addToCart(index: secondItemIndex)
        homeScreen.tapOnCatalogTab()
        homeScreen.addToCart(index: thirdItemIndex)
        /// Click on Proceed to check out button after adding multiple products
        cartScreen.tapOnProceedToCheckOutButton()
        ///Address screen
        shippingAddressScreen.enterUserAddressToPayment(userAddressTestData)
        ///Card details screen
        checkOutScreen.enterCardDetails(userCardDetailsTestData)
        placeOrderScreen.tapOnPlaceOrder()
        /// verifying for checkout successful message
        VerificationManager.validateTrue(for: checkoutCompleteScreen.checkForContinueShoppingButton())
        checkoutCompleteScreen.tapOnCotinueShoppingButton()
        TestLogger.shared.log("Test finished: \(self.name)")
    }
    
    func testVerifyItemRemovalFromCart() {
        TestLogger.shared.log("Test started: \(self.name)")
        /// Login
        homeScreen.tapOnMoreTab()
        moreScreen.tapOnLogin()
        //loginScreen.login(userName: userCredentialsTestData.validCredentials.userName ?? "", password: userCredentialsTestData.validCredentials.password ?? "")
        Helpers.loginWithRandomUser(on: loginScreen)
        homeScreen.tapOnMoreTab()
        ///Verify whether the user is logged in
        VerificationManager.validateTrue(for: moreScreen.checkForLogOut())
        ///Comes to dashboard screen
        homeScreen.tapOnCatalogTab()
        /// Add product to cart
        let (procutName,productCost) = homeScreen.getItemDetails(at: firstItemIndex)
        homeScreen.addToCart(index: firstItemIndex)
        let productCostInCart: String = cartScreen.getProductPriceInString()
        let productNameInCart: String = cartScreen.getProductNameString()
        VerificationManager.validateTrue(for: procutName == productNameInCart)
        VerificationManager.validateTrue(for: productCost == productCostInCart)
        cartScreen.tapOnRemoveFromCartButton()
        VerificationManager.validateTrue(for: cartScreen.checkForNoItemsDescText())
        TestLogger.shared.log("Test finished: \(self.name)")
    }
    
    ///This method defines verify the cart with no Items
    func testVerifyCheckOutWithEmptyCart() {
        TestLogger.shared.log("Test started: \(self.name)")
        /// Login
        homeScreen.tapOnMoreTab()
        moreScreen.tapOnLogin()
        //loginScreen.login(userName: userCredentialsTestData.validCredentials.userName ?? "", password: userCredentialsTestData.validCredentials.password ?? "")
        Helpers.loginWithRandomUser(on: loginScreen)
        homeScreen.tapOnMoreTab()
        ///Verify whether the user is logged in
        VerificationManager.validateTrue(for: moreScreen.checkForLogOut())
        ///Comes to dashboard screen
        homeScreen.tapOnCatalogTab()
        homeScreen.tapOnCartTab()
        VerificationManager.validateTrue(for: cartScreen.checkForNoItemsDescText())
        TestLogger.shared.log("Test finished: \(self.name)")
    }
        
    /// This method defines Add and Remove items from cart
    func testAddRemoveItemsFromCart() {
        TestLogger.shared.log("Test started: \(self.name)")
        /// Login
        homeScreen.tapOnMoreTab()
        moreScreen.tapOnLogin()
        loginScreen.login(userName: userCredentialsTestData.validCredentials.userName ?? "", password: userCredentialsTestData.validCredentials.password ?? "")
        homeScreen.tapOnMoreTab()
        VerificationManager.validateTrue(for: moreScreen.checkForLogOut())
        homeScreen.tapOnCatalogTab()
        /// Add product to cart
        let (procutName,productCost) = homeScreen.getItemDetails(at: firstItemIndex)
        homeScreen.addToCart(index: firstItemIndex)
        let productCostInCart:String = cartScreen.getProductPriceInString()
        let productNameInCart:String = cartScreen.getProductNameString()
        VerificationManager.validateTrue(for: procutName == productNameInCart)
        VerificationManager.validateTrue(for: productCost == productCostInCart)
        homeScreen.tapOnCatalogTab()
        homeScreen.addToCart(index: secondItemIndex)
        homeScreen.tapOnCatalogTab()
        homeScreen.addToCart(index: thirdItemIndex)
        cartScreen.tapOnRemoveFromCartButton()
        TestLogger.shared.log("Test finished: \(self.name)")
    }
}
