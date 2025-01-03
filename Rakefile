# Define the project and scheme
PROJECT_PATH = 'My Demo App.xcodeproj'    # Your project file path
WORKSPACE = 'My Demo App.xcworkspace'     # The workspace file path
DESTINATION = 'platform=iOS Simulator,name=iPhone 16'  # Simulator destination
CONFIGURATION = 'Debug'                   # Build configuration
DERIVED_DATA_PATH = './DerivedData'       # Derived Data path

# Method to build the test command dynamically (with scheme)
def build_test_command(scheme)
  "xcodebuild test \
    -workspace '#{WORKSPACE}' \
    -scheme '#{scheme}' \
    -destination '#{DESTINATION}' \
    -configuration '#{CONFIGURATION}' \
    -derivedDataPath '#{DERIVED_DATA_PATH}'"
end

# Separate section for Single Test, Multiple Tests in a Class, and Multiple Tests in Multiple Classes
namespace :custom_tests do
  # Run a single test from a specific class
  desc "Run a single test from a test class"
  task :run_single_test, [:test_class, :test_method] do |t, args|
    if args[:test_class] && args[:test_method]
      test_command = build_test_command('MyDemoAppUITests')  # Default scheme name
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
      test_command = build_test_command('MyDemoAppUITests')  # Default scheme name
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
    test_command = build_test_command('MyDemoAppUITests')  # Default scheme name

    test_command += " -only-testing:MyDemoAppUITests/CartAndCheckoutFlowTests/testMultipleItemsCheckOut"
    test_command += " -only-testing:MyDemoAppUITests/CartAndCheckoutFlowTests/testSmoke_VerifyCheckOutWithEmptyCart"

    puts "Running command: #{test_command}"
    sh test_command
  end

  # Run multiple tests from multiple classes
  desc "Run three tests with manually specified -only-testing flags"
  task :run_multiple_tests_in_classes do
    test_command = build_test_command('MyDemoAppUITests')  # Default scheme name

    test_command += " -only-testing:MyDemoAppUITests/CartAndCheckoutFlowTests/testMultipleItemsCheckOut"
    test_command += " -only-testing:MyDemoAppUITests/CartAndCheckoutFlowTests/testSmoke_VerifyCheckOutWithEmptyCart"
    test_command += " -only-testing:MyDemoAppUITests/ProductDetailsTests/testSanity_ProductDetails"

    puts "Running command: #{test_command}"
    sh test_command
  end

  # Run the Regression tests
  desc "Run the Regression tests"
  task :run_regression_tests do
    scheme = "MyDemoAppUITests(Regression)"
    test_command = build_test_command(scheme)  # Pass scheme to build_test_command
    puts "Running Regression tests with scheme '#{scheme}'"
    sh test_command
  end

  # Run the Smoke tests
  desc "Run the Smoke tests"
  task :run_smoke_tests do
    scheme = "MyDemoAppUITests(Smoke)"
    test_command = build_test_command(scheme)  # Pass scheme to build_test_command
    puts "Running Smoke tests with scheme '#{scheme}'"
    sh test_command
  end

  # Run the Sanity tests
  desc "Run the Sanity tests"
  task :run_sanity_tests do
    scheme = "MyDemoAppUITests(Sanity)"
    test_command = build_test_command(scheme)  # Pass scheme to build_test_command
    puts "Running Sanity tests with scheme '#{scheme}'"
    sh test_command
  end
end