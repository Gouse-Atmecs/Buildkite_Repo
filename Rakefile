# Rakefile for running iOS project tests

# Define the project and scheme
PROJECT_PATH = 'My Demo App.xcodeproj'    # Your project file path
WORKSPACE = 'My Demo App.xcworkspace'     # The workspace file path
SCHEME = 'MyDemoAppUITests'               # The scheme name
DESTINATION = 'platform=iOS Simulator,name=iPhone 16'  # Simulator destination

CONFIGURATION = 'Debug'                   # Build configuration

# Method to build the test command dynamically (without flags)
def build_test_command
  "xcodebuild test \
    -workspace '#{WORKSPACE}' \
    -scheme '#{SCHEME}' \
    -destination '#{DESTINATION}' \
    -configuration '#{CONFIGURATION}'"
end

# Separate section for Single Test, Multiple Tests in a Class, and Multiple Tests in Multiple Classes
namespace :custom_tests do
  # Run a single test from a specific class
  desc "Run a single test from a test class"
  task :run_single_test, [:test_class, :test_method] do |t, args|
    if args[:test_class] && args[:test_method]
      test_command = build_test_command  # No flag passed here
      test_command += " -only-testing:'#{args[:test_class]}/#{args[:test_method]}'"
      puts "Running single test: #{args[:test_class]}##{args[:test_method]}"
      sh test_command
    else
      puts "Usage: rake custom_tests:run_single_test[test_class,test_method]"
      exit 1
    end
  end

  # Run all tests in a specific class
  desc "Run all tests in a specific test class"
  task :run_all_tests_in_class, [:test_class] do |t, args|
    if args[:test_class]
      test_command = build_test_command  # No flag passed here
      test_command += " -only-testing:'#{args[:test_class]}'"
      puts "Running all tests in class: #{args[:test_class]}"
      sh test_command
    else
      puts "Usage: rake custom_tests:run_all_tests_in_class[test_class]"
      exit 1
    end
  end

  # Run multiple tests with manually specified -only-testing flags
  desc "Run multiple tests with two manually specified -only-testing flags"
  task :run_multiple_tests_in_class do
    # Build the base test command
    test_command = build_test_command

    # Add two -only-testing flags manually
    test_command += " -only-testing:MyDemoAppUITests/CartAndCheckoutFlowTests/testMultipleItemsCheckOut"
    test_command += " -only-testing:MyDemoAppUITests/CartAndCheckoutFlowTests/testVerifyCheckOutWithEmptyCart"

    # Print the command for debugging
    puts "Running command: #{test_command}"

    # Execute the command
    sh test_command
  end

  # Run multiple tests from multiple classes
  desc "Run three tests with manually specified -only-testing flags"
  task :run_multiple_tests_in_classes do
    # Build the base test command
    test_command = build_test_command

    # Add three -only-testing flags manually
    test_command += " -only-testing:MyDemoAppUITests/CartAndCheckoutFlowTests/testMultipleItemsCheckOut"
    test_command += " -only-testing:MyDemoAppUITests/CartAndCheckoutFlowTests/testVerifyCheckOutWithEmptyCart"
    test_command += " -only-testing:MyDemoAppUITests/ProductDetailsTests/testProductDetails"

    # Print the command for debugging
    puts "Running command: #{test_command}"

    # Execute the command
    sh test_command
  end
end
