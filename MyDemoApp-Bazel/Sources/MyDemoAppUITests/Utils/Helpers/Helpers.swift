//
//  Untitled.swift
//  My Demo App
//
//  Created by Sreenath Mudigonda on 05/11/24.
//

import XCTest
import Foundation


class Helpers {
    
    let app: XCUIApplication
    init(app: XCUIApplication) {
        self.app = app
    }
    
    static func isUIElementVisible(_ element: XCUIElement,wait:Double = 2) -> Bool{
        return element.waitForExistence(timeout: wait)
    }
    static func tapOnElement(_ element: XCUIElement){
        if element.exists && element.isHittable{
            element.tap()
        } else{
            XCTFail("\(element) \(ErrorMessages.DOES_NOT_EXISTS)")
            TestLogger.shared.log(LogMessages.DOES_NOT_EXISTS)
        }
    }
    static func enterText(_ element: XCUIElement, text: String) {
        if element.exists && element.isHittable {
            element.tap()  // Tap to focus if necessary
            element.typeText(text)
        } else {
            XCTFail(ErrorMessages.ELEMENT_IS_NOT_TRACEABLE)
            TestLogger.shared.log(LogMessages.ELEMENT_IS_NOT_TRACEABLE)
        }
    }
    static func getText(_ element: XCUIElement) -> String?{
        if element.exists && element.isHittable{
            return element.label
        } else{
            XCTFail("\(element) \(ErrorMessages.DOES_NOT_EXISTS)")
            TestLogger.shared.log(LogMessages.DOES_NOT_EXISTS)
            return nil
        }
    }
    static func clearTextField(_ element: XCUIElement) {
        element.tap()
        let currentText = element.value as? String ?? ""
        for _ in 0..<currentText.count {
            element.typeText("\u{8}") // This is the backspace key
        }
    }
    static func loadTestData<T: Decodable>(from fileName: String, ofType type: T.Type = T.self) -> T? {
        guard let url = Bundle(for: BaseTest.self).url(forResource: fileName, withExtension: "json") else {
            print(ErrorMessages.TEST_DATA_NOT_FOUND)
            TestLogger.shared.log(ErrorMessages.TEST_DATA_NOT_FOUND)
            return nil
        }
        do {
            // Load the data from the file
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let decodedData = try decoder.decode(T.self, from: data)
            return decodedData
        } catch {
            print("\(ErrorMessages.FAILED_TO_LOAD): \(error)")
            TestLogger.shared.log("\(ErrorMessages.FAILED_TO_LOAD) : \(error)")
            return nil
        }
    }
    
    var collectionView: XCUIElement {
        return app.collectionViews.element(boundBy: 0) // or a more specific index
    }
    /// This function allows to swipe multiple times
    func swipeUpMultipleTimes(count: Int, velocity: XCUIGestureVelocity = .fast) {
        let collectionView = self.collectionView
            // Ensure the collection view exists and is hittable
            guard collectionView.exists && collectionView.isHittable else {
                XCTFail(ErrorMessages.COLLECTION_VIEW_NOT_FOUND)
                return
            }
            for _ in 0..<count {
                collectionView.swipeUp(velocity: velocity)
            }
        }
    
    static func tapOnFirstMatch(in app: XCUIApplication, matching elementType: XCUIElement.ElementType, label: String? = nil) {
        // Find the matching elements by element type
        let matchingElements: [XCUIElement] = app.descendants(matching: elementType).allElementsBoundByIndex
        
        // If a label is provided, filter by label
        let filteredElements: [XCUIElement] = label != nil ? matchingElements.filter { $0.label == label } : matchingElements
        
        // Check if a match was found and tap on the first hittable element
        if let firstMatch: XCUIElement = filteredElements.first, firstMatch.exists && firstMatch.isHittable {
            firstMatch.tap()
        } else {
            XCTFail("Failed to tap on the \(elementType) element with label '\(label ?? "")': No hittable element found.")
        }
    }
    
    // Helper function to get random login credentials
    /// From this method we will take random login credentials
    static func getRandomLogin() -> CredentialsDataModel? {
        // Load the login data from the JSON file
        guard let loginData: UserCredentialsDataModel = Helpers.loadTestData(from: AppConstants.MULTIPLE_LOGIN_DETAILS) else {
            XCTFail(ErrorMessages.FAIL_LOADING_LOGIN_DATA)
            return nil
        }
        // Ensure the array is not empty
        guard !loginData.isEmpty else {
            XCTFail(ErrorMessages.LOADED_LOGIN_DATA_EMPTY)
            return nil
        }
        // Randomly pick a user from the array
        let randomIndex: Int = Int.random(in: 0..<loginData.count)
        return loginData[randomIndex]
    }
    
    // Helper function to log in with random user
    static func loginWithRandomUser(on loginScreen: LoginScreen) {
        guard let user = getRandomLogin() else {
            XCTFail(ErrorMessages.FAIL_GETTING_RANDOM_CREDENTIALS)
            return
        }
        // Ensure credentials are valid
        let userName = user.userName ?? ""
        let password = user.password ?? ""
        // Perform the login action
        loginScreen.login(userName: userName, password: password)
    }
}

struct ElementIdentifiers {
    static let PRODUCT_IMAGE =  "Product Image"
    static let PRODUCT_NAME = "Product Name"
    static let PRODUCT_COST = "Product Price"
    static let PRODUCT_FILTER = "Button"
    static let NAME_ASCENDING = "Name - Ascending"
    static let NAME_DESCENDING = "Name - Descending"
    static let OK_BUTTON = "OK"
    static let PRODUCT_IMAGE_DETAILS = "productImage"
    static let PRODUCT_NAME_DETAILS = "productName"
    static let PRODUCT_COST_DETAILS = "Price"
    static let PRODUCT_STAR_RATING_DETAILS = "fiveStar"
    static let GREEN_COLOR_BUTTON = "GreenColorUnSelected Icons"
    static let BLUE_COLOR_BUTTON = "BlueColorUnSelected Icons"
    static let INCREASE = "AddPlus Icons"
    static let DECREASE = "SubtractMinus Icons"
    static let PROCEED_TO_CHECKOUT = "ProceedToCheckout"
    static let COUNT_LABEL = "Amount"
    static let TOTAL_PRICE = "totalPrice"
    static let PRODUCT_PRICE = "productPrice"
    static let PRODUCT_NAME_IN_CART = "productName"
    static let PRODUCT_IMAGE_IN_CART = "productImage"
    static let PRODUCT_COUNT = "productCount"
    static let REMOVE_FROM_CART = "removeFromCart"
    static let REMOVE_ITEM = "Remove Item"
    static let ITEM_COUNT_LABEL = "ItemCountLabel"
    static let NO_ITEMS_LABEL = "Oh no! Your cart is empty. Fill it up with swag to complete your purchase."
    static let NO_ITEMS = "No Items"
    static let CART_TAB = "Cart-tab-item"
    static let CATALOG_TAB = "Catalog-tab-item"
    static let MORE_TAB = "More-tab-item"
    static let LOGIN_BUTTON = "Login Button"
    static let LOGOUT_BUTTON = "LogOut-menu-item"
    static let WEB_VIEW = "Webview-menu-item"
    static let GEO_LOCATION = "GeoLocation-menu-item"
    static let ABOUT = "About-menu-item"
    static let RESET_APP_STATE = "ResetAppState-menu-item"
    static let CRASH_APP = "CrashTheApp-menu-item"
    static let REPORT_A_BUG = "Report a Bug"
    static let GO_TO_SITE = "Go To Site"
    static let BACK_BUTTON = "BackButton Icons"
    static let GOOGLE = "Google"
    static let PLACE_ORDER_BUTTON = "Place Order"
    static let CONTINUE_SHOPPING = "ContinueShopping"
    static let ADD_TO_CART_BUTTON = "Add To Cart"
    static let TO_PAYMENT_BUTTON = "To Payment"
    static let REVIEW_ORDER_BUTTON = "Review Order"
    static let LOGIN = "Login"
    static let TWITTER =  "Twitter Icons"
    static let FACEBOOK = "Facebook Icons"
    static let LINKEDIN = "Linkedin Icons"
    static let ABOUT_MENU = "About "
    static let SAUCE_LABS = "Go to saucelabs.com"
    static let RESET_APP = "RESET APP"
    static let CANCEL = "Cancel"
    static let SEND = "Send"
    static let YOUR_MESSAGE = "Your Message"
    static let INVALID_EMAIL_ADDRESS = "Invalid email address, try again."
    static let CLOSE = "Close"
    static let FEED_BACK_SAVED = "Feedback saved"
    static let QR_CODE_SCANNER_BUTTON = "QrCodeScanner-menu-item"
    static let DRAWING_BUTTON = "Drawing-menu-item"
    static let FACE_ID_BUTTON = "FaceID"
    static let PUSH_NOTIFICATIONS_BUTTON = "pushNotifications"
    static let LOG_OUT_BUTTON = "LogOut-menu-item"
}
