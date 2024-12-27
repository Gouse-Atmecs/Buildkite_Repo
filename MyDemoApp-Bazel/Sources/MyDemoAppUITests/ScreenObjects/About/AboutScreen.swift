//
//  AboutScreen.swift
//  MyDemoAppUITests
//
//  Created by Mohammad Gouse Jani on 10/12/24.
//
import XCTest

class AboutScreen: BaseScreen {
    
    private lazy var aboutTitle = app.staticTexts[ElementIdentifiers.ABOUT_MENU]
    private lazy var sauceLabsLink = app.staticTexts[ElementIdentifiers.SAUCE_LABS]
    
    /// This function returns `true` if the `aboutTitle` UI element is visible on the screen.
    func isAboutTitleVisible() {
        VerificationManager.validateTrue(for: Helpers.isUIElementVisible(aboutTitle))
    }
    
    /// This function returns `true` if the `sauceLabsLink` UI element is visible on the screen.
    func isSauceLabsLinkVisible() {
        VerificationManager.validateTrue(for: Helpers.isUIElementVisible(sauceLabsLink))
    }
    
}
