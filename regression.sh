#!/bin/bash
# Set the workspace, scheme, and destination (adjust these according to your project)
WORKSPACE="My Demo App.xcworkspace"
SCHEME="MyDemoAppUITestsNew"
DESTINATION="platform=iOS Simulator,name=iPhone 16"

# Define the test target (adjust according to your project)
TARGET="MyDemoAppUITests"

# List of specific test cases you want to run
TEST_CASES=(
    "CartAndCheckoutFlowTests/testSmokeCheckOutWithEmptyCart"
    "ProductDetailsTests/testSmokeProductDetails"
    "LoginScenarioTests/testSanityEmptyLogin"
    "LogoutVerificationTests/testRegressionLogoutFunctionality"
)

# Loop through each test case and run it
for TEST_NAME in "${TEST_CASES[@]}"; do
    echo "Running test: $TEST_NAME"
    xcodebuild test -workspace "$WORKSPACE" -scheme "$SCHEME" -destination "$DESTINATION" -only-testing:$TARGET/$TEST_NAME
    if [ $? -ne 0 ]; then
        echo "Test $TEST_NAME failed."
        exit 1
    fi
done
echo "All specified tests have been executed."
