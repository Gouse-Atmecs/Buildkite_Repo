//
//  SocialMediaButtonsRedirectionTests.swift
//  MyDemoAppUITests
//
//  Created by Mohammad Gouse Jani on 04/12/24.
//

import XCTest

final class SocialMediaButtonsRedirectionTests: BaseTest {
    
    var homeScreen : HomeScreen!
    var moreScreen : MoreScreen!
    var loginScreen : LoginScreen!
    var userCredentialsTestData: UserCredentialsTestDataModel!
    var helpers: Helpers!
    
    override func setUp() {
        super.setUp()
        loadScreens()
        loadTestData()
    }
    /// in this function loading the screens
    func loadScreens() {
        homeScreen = HomeScreen(app: app)
        moreScreen = MoreScreen(app: app)
        loginScreen = LoginScreen(app: app)
        helpers = Helpers(app: app)
    }
    
    /// This functions loads test data for the tests
    func loadTestData() {
        userCredentialsTestData = Helpers.loadTestData(from: AppConstants.LOGIN,ofType: UserCredentialsTestDataModel.self)
    }
    
    func testSocialMediaButtonRedirection() {
        /// Login
        homeScreen.tapOnMoreTab()
        moreScreen.tapOnLogin()
        loginScreen.login(userName: userCredentialsTestData.validCredentials.userName ?? "", password: userCredentialsTestData.validCredentials.password ?? "")
        homeScreen.tapOnMoreTab()
        ///Verify whether the user is logged in
        VerificationManager.validateTrue(for: moreScreen.checkForLogOut())
        ///Comes to dashboard screen
        homeScreen.tapOnCatalogTab()
        //homeScreen.swipeUpMultipleTimes(count: 4, velocity: .fast)
        helpers.swipeUpMultipleTimes(count: 4, velocity: .fast)
        let socialMediaPlatforms: [String] = [AppConstants.TWITTER, AppConstants.FACEBOOK, AppConstants.LINKEDIN]
        for platform in socialMediaPlatforms {
            // Tap the social media button for the given platform
            homeScreen.tapOnSocialMediaButton(platform)
            // Verify the redirection for the current platform
            let isRedirected: Bool = homeScreen.verifyRedirection(for: platform)
            // Check if the redirection was successful
            if isRedirected {
                TestLogger.shared.log("\(platform.capitalized) \(LogMessages.REDIRECTION_SUCCESSFUL)")
            } else {
                // If not redirected, log the message but the test will still pass
                TestLogger.shared.log("\(platform.capitalized) \(LogMessages.DID_NOT_REDIRECT)")
                // Optionally, you can log this failure without failing the test
                // This can help you track which platforms failed to redirect
                TestLogger.shared.log("\(platform.capitalized) \(LogMessages.DID_NOT_REDIRECT_BUT_TEST_CONTINUES)")
                XCTFail("\(platform.capitalized) \(LogMessages.DID_NOT_REDIRECT_BUT_TEST_CONTINUES)")
            }
        }
    }
}
