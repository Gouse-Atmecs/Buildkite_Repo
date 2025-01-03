//
//  LogoutVerificationTests.swift
//  MyDemoAppUITests
//
//  Created by Mohammad Gouse Jani on 02/12/24.
//

import XCTest

final class LogoutVerificationTests: BaseTest {

    var homeScreen : HomeScreen!
    var moreScreen : MoreScreen!
    var loginScreen : LoginScreen!
    var userCredentialsTestData: UserCredentialsTestDataModel!
    
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
    }
    
    /// This functions loads test data for the tests
    func loadTestData() {
        userCredentialsTestData = Helpers.loadTestData(from: AppConstants.LOGIN,ofType: UserCredentialsTestDataModel.self)
    }
    /// This method defines Logout functinality
    func testSanity_LogoutFunctionality() {
        ///Login
            homeScreen.tapOnMoreTab()
            moreScreen.tapOnLogin()
            loginScreen.login(userName: userCredentialsTestData.validCredentials.userName ?? "", password: userCredentialsTestData.validCredentials.password ?? "")
            homeScreen.tapOnMoreTab()
            VerificationManager.validateTrue(for: moreScreen.checkForLogOut())
            moreScreen.tapOnLogOut()
            /// Verifying whether user logged out succefully or not
            VerificationManager.validateTrue(for: loginScreen.checkForLoginButton())
    }
}
