//
//  LoginScenarioTests.swift
//  MyDemoAppUITests
//
//  Created by Mohammad Gouse Jani on 28/11/24.
//

import XCTest

final class LoginScenarioTests: BaseTest {

    var homeScreen : HomeScreen!
    var moreScreen : MoreScreen!
    var loginScreen : LoginScreen!
    var cartScreen : CartScreen!
    var shippingAddressScreeen: ShippingAdressScreen!
    var checkOutScreen:CheckOutScreen!
    var placeOrderScreen:PlaceOrderScreen!
    var checkoutCompleteScreen : CheckoutCompleteScreen!
    
    var userCredentialsTestData: UserCredentialsTestDataModel!
    var userAddressTestData : UserAddressModel!
    var userCardDetailsTestData : UserCardDetailsModel!
    
    let firstItemIndex: Int = 0
    let secondItemIndex: Int = 1
   // Property Wrapper for categorizing tests
    @TestCategory(wrappedValue: "Smoke")
    var smokeCategory: String

    @TestCategory(wrappedValue: "Regression")
    var regressionCategory: String
   
   
    override func setUp() {
        super.setUp()
        loadScreens()
        loadTestData()
        
        TestLogger.shared.clearLog()
        TestLogger.shared.log("Test started: \(self.name)")
    }
    
    func loadScreens(){
        homeScreen = HomeScreen(app: app)
        moreScreen = MoreScreen(app: app)
        loginScreen = LoginScreen(app: app)
        shippingAddressScreeen =  ShippingAdressScreen(app: app)
        cartScreen = CartScreen(app: app)
        checkOutScreen = CheckOutScreen(app: app)
        placeOrderScreen = PlaceOrderScreen(app: app)
        checkoutCompleteScreen = CheckoutCompleteScreen(app: app)
    }
    
    func loadTestData(){
        userCredentialsTestData = Helpers.loadTestData(from: AppConstants.LOGIN,ofType: UserCredentialsTestDataModel.self)
        userAddressTestData = Helpers.loadTestData(from: AppConstants.ADDRESS,ofType: UserAddressModel.self)
        userCardDetailsTestData = Helpers.loadTestData(from: AppConstants.CARD_DETAILS,ofType: UserCardDetailsModel.self)
    }
#if SMOKE || REGRESSION
   func testLoginPageUIElemetsExists(){
      TestLogger.shared.log("Test started: \(self.name)")
      ///Display the Menu Items
      homeScreen.tapOnMoreTab()
      moreScreen.tapOnLogin()
      ///Login Screen Check for elements existence
      loginScreen.checkforUserNameTextField()
      loginScreen.checkForPasswordTextField()
      loginScreen.checkForLoginBtn()
      TestLogger.shared.log("Test finished: \(self.name)")
   }
#endif
   
#if SMOKE || REGRESSION
   func testLoginPageUIElementsInteraction(){
      TestLogger.shared.log("Test started: \(self.name)")
      ///Display the Menu Items
      homeScreen.tapOnMoreTab()
      moreScreen.tapOnLogin()
      ///Login Screen Check for interactions
      loginScreen.isUserNameTextFieldClickable()
      loginScreen.isPasswordTextFieldClickable()
      loginScreen.isLoginBtnClickable()
      TestLogger.shared.log("Test finished: \(self.name)")
   }
#endif
   
   #if SMOKE || REGRESSION
    func testEmptyLogin(){
            TestLogger.shared.log("Test started: \(self.name)")
            homeScreen.tapOnMoreTab()
            moreScreen.tapOnLogin()
            loginScreen.tapOnLogin()
            loginScreen.assertEmptyUserName()
            loginScreen.tapOnAlertOkBtn()
            TestLogger.shared.log("Test finished: \(self.name)")
    }
#endif
   
#if SANITY
    func testLoginAndItemPurchase(){
            TestLogger.shared.log("Test started: \(self.name)")
            /// Login
            homeScreen.tapOnMoreTab()
           
            moreScreen.tapOnLogin()
            //loginScreen.login(userName: userCredentialsTestData.validCredentials.userName ?? "", password: userCredentialsTestData.validCredentials.password ?? "")
            Helpers.loginWithRandomUser(on: loginScreen)
            homeScreen.tapOnMoreTab()
            /// Verifying whether user logged in succefully or not
            VerificationManager.validateTrue(for: moreScreen.checkForLogOut())
            
            homeScreen.tapOnCatalogTab()
            // add product to cart
            let (procutName,productCost) = homeScreen.getItemDetails(at: firstItemIndex)
            homeScreen.addToCart(index: firstItemIndex)
           
            let productCostInCart: String = cartScreen.getProductPriceInString()
            let productNameInCart: String = cartScreen.getProductNameString()
            
            VerificationManager.validateTrue(for: procutName == productNameInCart)
            VerificationManager.validateTrue(for: productCost == productCostInCart)
            
            //add one more product
            homeScreen.tapOnCatalogTab()
            homeScreen.addToCart(index: secondItemIndex)
            
            cartScreen.tapOnProceedToCheckOutButton()
            
            shippingAddressScreeen.enterUserAddressToPayment(userAddressTestData)
            checkOutScreen.enterCardDetails(userCardDetailsTestData)
            placeOrderScreen.tapOnPlaceOrder()
            /// verifying for checkout successful message
            VerificationManager.validateTrue(for: checkoutCompleteScreen.checkForContinueShoppingButton())
            checkoutCompleteScreen.tapOnCotinueShoppingButton()
            
            TestLogger.shared.log("Test finished: \(self.name)")
    }
#endif
    func testLoginFailedWithInvalidCredential(){
        TestLogger.shared.log("Test started: \(self.name)")
        homeScreen.tapOnMoreTab()
        moreScreen.tapOnLogin()
        loginScreen.login(userName: userCredentialsTestData.invalidCredentials.userName ?? "", password: userCredentialsTestData.invalidCredentials.password ?? "")
        loginScreen.assertErrorMessageIsDisplayed()
        TestLogger.shared.log(LogMessages.INVALID_CREDENTENTIALS_ENTERED)
    }
}
