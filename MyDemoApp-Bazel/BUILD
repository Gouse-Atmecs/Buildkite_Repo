load("@build_bazel_rules_apple//apple:ios.bzl", "ios_application", "ios_test")

# Define the iOS application
ios_application(
    name = "my_demo_app",
    bundle_id = "com.saucelabs.mydemo.app.ios",
    families = ["iphone"],
    minimum_os_version = "15.0",
    infoplists = [":MyDemoApp-Info.plist"],
    srcs = [
        "src/AppDelegate.m",
        "src/ViewController.m",
        "src/main.m",  # Your app's main entry point
    ],
    hdrs = glob(["headers/*.h"]),
    data = [
        "resources/MyDemoApp.xib",  # Your Interface Builder files
    ],
)

# Define the XCUITests target
ios_test(
    name = "my_demo_app_tests",
    srcs = glob(["MyDemoAppUITests/*.swift"]),  # Path to your XCUITests in Swift
    test_host = ":my_demo_app",      # Referencing the app target as the test host
    deps = [
        "//ios-app:my demo app",     # This is the app target you defined earlier
    ],
)