import Foundation
#if canImport(AppKit)
import AppKit
#endif
#if canImport(UIKit)
import UIKit
#endif
#if canImport(SwiftUI)
import SwiftUI
#endif
#if canImport(DeveloperToolsSupport)
import DeveloperToolsSupport
#endif

#if SWIFT_PACKAGE
private let resourceBundle = Foundation.Bundle.module
#else
private class ResourceBundleClass {}
private let resourceBundle = Foundation.Bundle(for: ResourceBundleClass.self)
#endif

// MARK: - Color Symbols -

@available(iOS 11.0, macOS 10.13, tvOS 11.0, *)
extension ColorResource {

}

// MARK: - Image Symbols -

@available(iOS 11.0, macOS 10.7, tvOS 11.0, *)
extension ImageResource {

    /// The "AddPlus Icons" asset catalog image resource.
    static let addPlusIcons = ImageResource(name: "AddPlus Icons", bundle: resourceBundle)

    /// The "AddToCart Icons" asset catalog image resource.
    static let addToCartIcons = ImageResource(name: "AddToCart Icons", bundle: resourceBundle)

    /// The "AddToCart2Selected Icons" asset catalog image resource.
    static let addToCart2SelectedIcons = ImageResource(name: "AddToCart2Selected Icons", bundle: resourceBundle)

    /// The "AddToCart2Unselected Icons" asset catalog image resource.
    static let addToCart2UnselectedIcons = ImageResource(name: "AddToCart2Unselected Icons", bundle: resourceBundle)

    /// The "AddToCartUnselected Icons" asset catalog image resource.
    static let addToCartUnselectedIcons = ImageResource(name: "AddToCartUnselected Icons", bundle: resourceBundle)

    /// The "AddToCatSelected Icons" asset catalog image resource.
    static let addToCatSelectedIcons = ImageResource(name: "AddToCatSelected Icons", bundle: resourceBundle)

    /// The "AppLogo Icons" asset catalog image resource.
    static let appLogoIcons = ImageResource(name: "AppLogo Icons", bundle: resourceBundle)

    /// The "AppTitle Icons" asset catalog image resource.
    static let appTitleIcons = ImageResource(name: "AppTitle Icons", bundle: resourceBundle)

    /// The "BackButton Icons" asset catalog image resource.
    static let backButtonIcons = ImageResource(name: "BackButton Icons", bundle: resourceBundle)

    /// The "BagBlack Image" asset catalog image resource.
    static let bagBlack = ImageResource(name: "BagBlack Image", bundle: resourceBundle)

    /// The "BagGreen Image" asset catalog image resource.
    static let bagGreen = ImageResource(name: "BagGreen Image", bundle: resourceBundle)

    /// The "BagOrange Image" asset catalog image resource.
    static let bagOrange = ImageResource(name: "BagOrange Image", bundle: resourceBundle)

    /// The "BagRed Image" asset catalog image resource.
    static let bagRed = ImageResource(name: "BagRed Image", bundle: resourceBundle)

    /// The "BagViolet Image" asset catalog image resource.
    static let bagViolet = ImageResource(name: "BagViolet Image", bundle: resourceBundle)

    /// The "BagYellow Image" asset catalog image resource.
    static let bagYellow = ImageResource(name: "BagYellow Image", bundle: resourceBundle)

    /// The "BikeLight Image" asset catalog image resource.
    static let bikeLight = ImageResource(name: "BikeLight Image", bundle: resourceBundle)

    /// The "BlackColorSelected Icons" asset catalog image resource.
    static let blackColorSelectedIcons = ImageResource(name: "BlackColorSelected Icons", bundle: resourceBundle)

    /// The "BlackColorUnSelected Icons" asset catalog image resource.
    static let blackColorUnSelectedIcons = ImageResource(name: "BlackColorUnSelected Icons", bundle: resourceBundle)

    /// The "BlueColorSelected Icons" asset catalog image resource.
    static let blueColorSelectedIcons = ImageResource(name: "BlueColorSelected Icons", bundle: resourceBundle)

    /// The "BlueColorUnSelected Icons" asset catalog image resource.
    static let blueColorUnSelectedIcons = ImageResource(name: "BlueColorUnSelected Icons", bundle: resourceBundle)

    /// The "CartEmpty Icons" asset catalog image resource.
    static let cartEmptyIcons = ImageResource(name: "CartEmpty Icons", bundle: resourceBundle)

    /// The "CatalogSelected Icons" asset catalog image resource.
    static let catalogSelectedIcons = ImageResource(name: "CatalogSelected Icons", bundle: resourceBundle)

    /// The "CatalogUnselected Icons" asset catalog image resource.
    static let catalogUnselectedIcons = ImageResource(name: "CatalogUnselected Icons", bundle: resourceBundle)

    /// The "CheckBoxSelected Icons" asset catalog image resource.
    static let checkBoxSelectedIcons = ImageResource(name: "CheckBoxSelected Icons", bundle: resourceBundle)

    /// The "CheckBoxUnselected Icons" asset catalog image resource.
    static let checkBoxUnselectedIcons = ImageResource(name: "CheckBoxUnselected Icons", bundle: resourceBundle)

    /// The "ClearButton Icons" asset catalog image resource.
    static let clearButtonIcons = ImageResource(name: "ClearButton Icons", bundle: resourceBundle)

    /// The "Delete Icons" asset catalog image resource.
    static let deleteIcons = ImageResource(name: "Delete Icons", bundle: resourceBundle)

    /// The "DrawingBackground Icons" asset catalog image resource.
    static let drawingBackgroundIcons = ImageResource(name: "DrawingBackground Icons", bundle: resourceBundle)

    /// The "FaceId Icons" asset catalog image resource.
    static let faceIdIcons = ImageResource(name: "FaceId Icons", bundle: resourceBundle)

    /// The "Facebook Icons" asset catalog image resource.
    static let facebookIcons = ImageResource(name: "Facebook Icons", bundle: resourceBundle)

    /// The "ForwordArrow Icons" asset catalog image resource.
    static let forwordArrowIcons = ImageResource(name: "ForwordArrow Icons", bundle: resourceBundle)

    /// The "GrayButton Icons" asset catalog image resource.
    static let grayButtonIcons = ImageResource(name: "GrayButton Icons", bundle: resourceBundle)

    /// The "GrayColorSelected Icons" asset catalog image resource.
    static let grayColorSelectedIcons = ImageResource(name: "GrayColorSelected Icons", bundle: resourceBundle)

    /// The "GrayColorUnSelected Icons" asset catalog image resource.
    static let grayColorUnSelectedIcons = ImageResource(name: "GrayColorUnSelected Icons", bundle: resourceBundle)

    /// The "GrayRoundView Icons" asset catalog image resource.
    static let grayRoundViewIcons = ImageResource(name: "GrayRoundView Icons", bundle: resourceBundle)

    /// The "GreenButton Icons" asset catalog image resource.
    static let greenButtonIcons = ImageResource(name: "GreenButton Icons", bundle: resourceBundle)

    /// The "GreenColorSelected Icons" asset catalog image resource.
    static let greenColorSelectedIcons = ImageResource(name: "GreenColorSelected Icons", bundle: resourceBundle)

    /// The "GreenColorUnselected Icons" asset catalog image resource.
    static let greenColorUnselectedIcons = ImageResource(name: "GreenColorUnselected Icons", bundle: resourceBundle)

    /// The "GreenRoundView Icons" asset catalog image resource.
    static let greenRoundViewIcons = ImageResource(name: "GreenRoundView Icons", bundle: resourceBundle)

    /// The "JacketBlue Image" asset catalog image resource.
    static let jacketBlue = ImageResource(name: "JacketBlue Image", bundle: resourceBundle)

    /// The "JacketBrown Image" asset catalog image resource.
    static let jacketBrown = ImageResource(name: "JacketBrown Image", bundle: resourceBundle)

    /// The "JacketGray Image" asset catalog image resource.
    static let jacketGray = ImageResource(name: "JacketGray Image", bundle: resourceBundle)

    /// The "JacketGreen Image" asset catalog image resource.
    static let jacketGreen = ImageResource(name: "JacketGreen Image", bundle: resourceBundle)

    /// The "JacketPink Image" asset catalog image resource.
    static let jacketPink = ImageResource(name: "JacketPink Image", bundle: resourceBundle)

    /// The "JacketRed Image" asset catalog image resource.
    static let jacketRed = ImageResource(name: "JacketRed Image", bundle: resourceBundle)

    /// The "Linkedin Icons" asset catalog image resource.
    static let linkedinIcons = ImageResource(name: "Linkedin Icons", bundle: resourceBundle)

    /// The "Menu Icons" asset catalog image resource.
    static let menuIcons = ImageResource(name: "Menu Icons", bundle: resourceBundle)

    /// The "PlusMoreSelected Icons" asset catalog image resource.
    static let plusMoreSelectedIcons = ImageResource(name: "PlusMoreSelected Icons", bundle: resourceBundle)

    /// The "PlusMoreUnselected Icons" asset catalog image resource.
    static let plusMoreUnselectedIcons = ImageResource(name: "PlusMoreUnselected Icons", bundle: resourceBundle)

    /// The "PonyExpress Icons" asset catalog image resource.
    static let ponyExpressIcons = ImageResource(name: "PonyExpress Icons", bundle: resourceBundle)

    /// The "QR Icons" asset catalog image resource.
    static let qrIcons = ImageResource(name: "QR Icons", bundle: resourceBundle)

    /// The "QuestionMark Icons" asset catalog image resource.
    static let questionMarkIcons = ImageResource(name: "QuestionMark Icons", bundle: resourceBundle)

    /// The "RedButton Icons" asset catalog image resource.
    static let redButtonIcons = ImageResource(name: "RedButton Icons", bundle: resourceBundle)

    /// The "RedColorSelected Icons" asset catalog image resource.
    static let redColorSelectedIcons = ImageResource(name: "RedColorSelected Icons", bundle: resourceBundle)

    /// The "RedColorUnSelected Icons" asset catalog image resource.
    static let redColorUnSelectedIcons = ImageResource(name: "RedColorUnSelected Icons", bundle: resourceBundle)

    /// The "RedRoundView Icons" asset catalog image resource.
    static let redRoundViewIcons = ImageResource(name: "RedRoundView Icons", bundle: resourceBundle)

    /// The "Robot Icons" asset catalog image resource.
    static let robotIcons = ImageResource(name: "Robot Icons", bundle: resourceBundle)

    /// The "SaveButton Icons" asset catalog image resource.
    static let saveButtonIcons = ImageResource(name: "SaveButton Icons", bundle: resourceBundle)

    /// The "SearchNotFound Icons" asset catalog image resource.
    static let searchNotFoundIcons = ImageResource(name: "SearchNotFound Icons", bundle: resourceBundle)

    /// The "ShirtOrange Image" asset catalog image resource.
    static let shirtOrange = ImageResource(name: "ShirtOrange Image", bundle: resourceBundle)

    /// The "ShirtPink Image" asset catalog image resource.
    static let shirtPink = ImageResource(name: "ShirtPink Image", bundle: resourceBundle)

    /// The "ShirtPurple Image" asset catalog image resource.
    static let shirtPurple = ImageResource(name: "ShirtPurple Image", bundle: resourceBundle)

    /// The "ShirtRed Image" asset catalog image resource.
    static let shirtRed = ImageResource(name: "ShirtRed Image", bundle: resourceBundle)

    /// The "ShirtRedOnesie Image" asset catalog image resource.
    static let shirtRedOnesie = ImageResource(name: "ShirtRedOnesie Image", bundle: resourceBundle)

    /// The "ShirtTurquoise Image" asset catalog image resource.
    static let shirtTurquoise = ImageResource(name: "ShirtTurquoise Image", bundle: resourceBundle)

    /// The "ShirtYellow Image" asset catalog image resource.
    static let shirtYellow = ImageResource(name: "ShirtYellow Image", bundle: resourceBundle)

    /// The "SortNameAscending Icons" asset catalog image resource.
    static let sortNameAscendingIcons = ImageResource(name: "SortNameAscending Icons", bundle: resourceBundle)

    /// The "SortNameDescending Icons" asset catalog image resource.
    static let sortNameDescendingIcons = ImageResource(name: "SortNameDescending Icons", bundle: resourceBundle)

    /// The "SortPriceAscending Icons" asset catalog image resource.
    static let sortPriceAscendingIcons = ImageResource(name: "SortPriceAscending Icons", bundle: resourceBundle)

    /// The "SortPriceDescending Icons" asset catalog image resource.
    static let sortPriceDescendingIcons = ImageResource(name: "SortPriceDescending Icons", bundle: resourceBundle)

    /// The "SortSelected Icons" asset catalog image resource.
    static let sortSelectedIcons = ImageResource(name: "SortSelected Icons", bundle: resourceBundle)

    /// The "StarSelected Icons" asset catalog image resource.
    static let starSelectedIcons = ImageResource(name: "StarSelected Icons", bundle: resourceBundle)

    /// The "StarUnSelected Icons" asset catalog image resource.
    static let starUnSelectedIcons = ImageResource(name: "StarUnSelected Icons", bundle: resourceBundle)

    /// The "SubtractMinus Icons" asset catalog image resource.
    static let subtractMinusIcons = ImageResource(name: "SubtractMinus Icons", bundle: resourceBundle)

    /// The "SwitchSelected Icons" asset catalog image resource.
    static let switchSelectedIcons = ImageResource(name: "SwitchSelected Icons", bundle: resourceBundle)

    /// The "SwitchUnselected Icons" asset catalog image resource.
    static let switchUnselectedIcons = ImageResource(name: "SwitchUnselected Icons", bundle: resourceBundle)

    /// The "TShirtBlack Image" asset catalog image resource.
    static let tShirtBlack = ImageResource(name: "TShirtBlack Image", bundle: resourceBundle)

    /// The "TShirtBlue Image" asset catalog image resource.
    static let tShirtBlue = ImageResource(name: "TShirtBlue Image", bundle: resourceBundle)

    /// The "TShirtGreen Image" asset catalog image resource.
    static let tShirtGreen = ImageResource(name: "TShirtGreen Image", bundle: resourceBundle)

    /// The "TShirtRed Image" asset catalog image resource.
    static let tShirtRed = ImageResource(name: "TShirtRed Image", bundle: resourceBundle)

    /// The "TShirtYellow Image" asset catalog image resource.
    static let tShirtYellow = ImageResource(name: "TShirtYellow Image", bundle: resourceBundle)

    /// The "Tick Icons" asset catalog image resource.
    static let tickIcons = ImageResource(name: "Tick Icons", bundle: resourceBundle)

    /// The "Twitter Icons" asset catalog image resource.
    static let twitterIcons = ImageResource(name: "Twitter Icons", bundle: resourceBundle)

    /// The "mastercard Icons" asset catalog image resource.
    static let mastercardIcons = ImageResource(name: "mastercard Icons", bundle: resourceBundle)

    /// The "visa Icons" asset catalog image resource.
    static let visaIcons = ImageResource(name: "visa Icons", bundle: resourceBundle)

}

// MARK: - Backwards Deployment Support -

/// A color resource.
struct ColorResource: Swift.Hashable, Swift.Sendable {

    /// An asset catalog color resource name.
    fileprivate let name: Swift.String

    /// An asset catalog color resource bundle.
    fileprivate let bundle: Foundation.Bundle

    /// Initialize a `ColorResource` with `name` and `bundle`.
    init(name: Swift.String, bundle: Foundation.Bundle) {
        self.name = name
        self.bundle = bundle
    }

}

/// An image resource.
struct ImageResource: Swift.Hashable, Swift.Sendable {

    /// An asset catalog image resource name.
    fileprivate let name: Swift.String

    /// An asset catalog image resource bundle.
    fileprivate let bundle: Foundation.Bundle

    /// Initialize an `ImageResource` with `name` and `bundle`.
    init(name: Swift.String, bundle: Foundation.Bundle) {
        self.name = name
        self.bundle = bundle
    }

}

#if canImport(AppKit)
@available(macOS 10.13, *)
@available(macCatalyst, unavailable)
extension AppKit.NSColor {

    /// Initialize a `NSColor` with a color resource.
    convenience init(resource: ColorResource) {
        self.init(named: NSColor.Name(resource.name), bundle: resource.bundle)!
    }

}

protocol _ACResourceInitProtocol {}
extension AppKit.NSImage: _ACResourceInitProtocol {}

@available(macOS 10.7, *)
@available(macCatalyst, unavailable)
extension _ACResourceInitProtocol {

    /// Initialize a `NSImage` with an image resource.
    init(resource: ImageResource) {
        self = resource.bundle.image(forResource: NSImage.Name(resource.name))! as! Self
    }

}
#endif

#if canImport(UIKit)
@available(iOS 11.0, tvOS 11.0, *)
@available(watchOS, unavailable)
extension UIKit.UIColor {

    /// Initialize a `UIColor` with a color resource.
    convenience init(resource: ColorResource) {
#if !os(watchOS)
        self.init(named: resource.name, in: resource.bundle, compatibleWith: nil)!
#else
        self.init()
#endif
    }

}

@available(iOS 11.0, tvOS 11.0, *)
@available(watchOS, unavailable)
extension UIKit.UIImage {

    /// Initialize a `UIImage` with an image resource.
    convenience init(resource: ImageResource) {
#if !os(watchOS)
        self.init(named: resource.name, in: resource.bundle, compatibleWith: nil)!
#else
        self.init()
#endif
    }

}
#endif

#if canImport(SwiftUI)
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension SwiftUI.Color {

    /// Initialize a `Color` with a color resource.
    init(_ resource: ColorResource) {
        self.init(resource.name, bundle: resource.bundle)
    }

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension SwiftUI.Image {

    /// Initialize an `Image` with an image resource.
    init(_ resource: ImageResource) {
        self.init(resource.name, bundle: resource.bundle)
    }

}
#endif