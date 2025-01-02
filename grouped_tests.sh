#!/bin/bash

# Define workspace, scheme, and destination
WORKSPACE="My Demo App.xcworkspace"
SCHEME="MyDemoAppUITestsNew"
DESTINATION="platform=iOS Simulator,name=iPhone 16"
TARGET="MyDemoAppUITests"

# Check if TEST_CATEGORY is set through the argument, otherwise default to 'Sanity'
CATEGORY=$1  # Get the category from the command-line argument, e.g., "smoke", "sanity", "regression"

if [ -z "$CATEGORY" ]; then
    echo "Please provide a category (e.g., smoke, sanity, regression)."
    exit 1
fi

# Define test cases for each category using indexed arrays
SANITY_TESTS=(
    "CartAndCheckoutFlowTests/testVerifyItemRemovalFromCart"
    "LoginScenarioTests/testEmptyLogin"
)

SMOKE_TESTS=(
    "ProductDetailsTests/testProductDetails"
    "LoginScenarioTests/testLoginAndItemPurchase"
)

REGRESSION_TESTS=(
    "LoginScenarioTests/testLoginAndItemPurchase"
    "CartAndCheckoutFlowTests/testVerifyCheckOutWithEmptyCart"
    "LogoutVerificationTests/testLogoutFunctionality"
)

# Function to run tests for a specific category
run_tests_for_category() {
    CATEGORY=$1
    shift  # Remove the first argument (CATEGORY), leaving the array of tests
    
    TESTS=("$@")  # Get the remaining arguments as the array of tests
    
    echo "Running $CATEGORY tests..."
    
    for TEST in "${TESTS[@]}"; do
        echo "Running test: $TEST"
        xcodebuild test -workspace "$WORKSPACE" -scheme "$SCHEME" -destination "$DESTINATION" -only-testing:$TARGET/$TEST
        if [ $? -ne 0 ]; then
            echo "$CATEGORY test $TEST failed."
            exit 1
        fi
    done
}

# Run tests based on the provided category
case $CATEGORY in
    "sanity")
        run_tests_for_category "$CATEGORY" "${SANITY_TESTS[@]}"
        ;;
    "smoke")
        run_tests_for_category "$CATEGORY" "${SMOKE_TESTS[@]}"
        ;;
    "regression")
        run_tests_for_category "$CATEGORY" "${REGRESSION_TESTS[@]}"
        ;;
    *)
        echo "Unknown category: $CATEGORY"
        exit 1
        ;;
esac

echo "$CATEGORY tests completed successfully."
