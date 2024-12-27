#!/bin/bash

# Define your test commands with appropriate flags for each configuration
# Command for running regression tests
REGRESSION_TEST_COMMAND="xcodebuild test \
  -workspace 'My Demo App.xcworkspace' \
  -scheme 'MyDemoAppUITests' \
  -destination 'platform=iOS Simulator,name=iPhone 16' \
  -configuration Debug \
  OTHER_SWIFT_FLAGS='-DREGRESSION'"

# Command for running smoke tests
SMOKE_TEST_COMMAND="xcodebuild test \
  -workspace 'My Demo App.xcworkspace' \
  -scheme 'MyDemoAppUITests' \
  -destination 'platform=iOS Simulator,name=iPhone 16' \
  -configuration Debug \
  OTHER_SWIFT_FLAGS='-DSMOKE'"

# Command for running sanity tests
SANITY_TEST_COMMAND="xcodebuild test \
  -workspace 'My Demo App.xcworkspace' \
  -scheme 'MyDemoAppUITests' \
  -destination 'platform=iOS Simulator,name=iPhone 16' \
  -configuration Debug \
  OTHER_SWIFT_FLAGS='-DSANITY'"

# Check for the argument passed and run corresponding command
case "$1" in
  "regression")
    echo "Running Regression tests"
    eval $REGRESSION_TEST_COMMAND
    ;;
  "smoke")
    echo "Running Smoke tests"
    eval $SMOKE_TEST_COMMAND
    ;;
  "sanity")
    echo "Running Sanity tests"
    eval $SANITY_TEST_COMMAND
    ;;
  *)
    echo "Usage: $0 {regression|smoke|sanity}"
    exit 1
    ;;
esac

