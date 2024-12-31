# Define the project and scheme
PROJECT_PATH = 'My Demo App.xcodeproj'    # Your project file path
WORKSPACE = 'My Demo App.xcworkspace'     # The workspace file path
DESTINATION_1 = 'platform=iOS Simulator,name=iPhone 16'  # First simulator destination
DESTINATION_2 = 'platform=iOS Simulator,name=iPhone 16 Pro'  # Second simulator destination
CONFIGURATION = 'Debug'                   # Build configuration
DERIVED_DATA_PATH = './DerivedData'       # Derived Data path

# Method to build the test command dynamically (with scheme)
def build_test_command(scheme, destination)
  derived_data_path = "./DerivedData/#{destination.split('=').last}"
  "xcodebuild test \
    -workspace '#{WORKSPACE}' \
    -scheme '#{scheme}' \
    -destination '#{destination}' \
    -configuration '#{CONFIGURATION}' \
    -derivedDataPath '#{derived_data_path}'"
end

# Separate section for Single Test, Multiple Tests in a Class, and Multiple Tests in Multiple Classes
namespace :custom_tests do
  # Run a single test from a specific class
  desc "Run a single test from a test class"
  task :run_single_test, [:test_class, :test_method] do |t, args|
    if args[:test_class] && args[:test_method]
      # Parallel testing on both simulators
      [DESTINATION_1, DESTINATION_2].each_with_index do |destination, index|
        fork do
          test_command = build_test_command('MyDemoAppUITestsNew', destination)  # Default scheme name
          test_command += " -only-testing:'#{args[:test_class]}/#{args[:test_method]}'"
          puts "Running single test: #{args[:test_class]}##{args[:test_method]} on Simulator #{destination} (Task #{index+1})"
          system(test_command)
        end
      end
      Process.waitall  # Wait for all the forks to finish
    else
      puts "Usage: rake custom_tests:run_single_test[test_class,test_method]"
      exit 1
    end
  end

  # Run all tests in a specific class
  desc "Run all tests in a specific test class"
  task :run_all_tests_in_class, [:test_class] do |t, args|
    if args[:test_class]
      # Parallel testing on both simulators
      [DESTINATION_1, DESTINATION_2].each_with_index do |destination, index|
        fork do
          test_command = build_test_command('MyDemoAppUITestsNew', destination)  # Default scheme name
          test_command += " -only-testing:'#{args[:test_class]}'"
          puts "Running all tests in class: #{args[:test_class]} on Simulator #{destination} (Task #{index+1})"
          system(test_command)
        end
      end
      Process.waitall  # Wait for all the forks to finish
    else
      puts "Usage: rake custom_tests:run_all_tests_in_class[test_class]"
      exit 1
    end
  end

  # Run multiple tests with manually specified -only-testing flags
  desc "Run multiple tests with two manually specified -only-testing flags"
  task :run_multiple_tests_in_class do
    # Parallel testing on both simulators
    [DESTINATION_1, DESTINATION_2].each_with_index do |destination, index|
      fork do
        test_command = build_test_command('MyDemoAppUITestsNew', destination)  # Default scheme name
        test_command += " -only-testing:MyDemoAppUITestsNew/CartAndCheckoutFlowTests/testMultipleItemsCheckOut"
        test_command += " -only-testing:MyDemoAppUITestsNew/CartAndCheckoutFlowTests/testVerifyCheckOutWithEmptyCart"
        puts "Running multiple tests on Simulator #{destination} (Task #{index+1})"
        system(test_command)
      end
    end
    Process.waitall  # Wait for all the forks to finish
  end

  # Run multiple tests from multiple classes
  desc "Run three tests with manually specified -only-testing flags"
  task :run_multiple_tests_in_classes do
    # Parallel testing on both simulators
    [DESTINATION_1, DESTINATION_2].each_with_index do |destination, index|
      fork do
        test_command = build_test_command('MyDemoAppUITestsNew', destination)  # Default scheme name
        test_command += " -only-testing:MyDemoAppUITestsNew/CartAndCheckoutFlowTests/testMultipleItemsCheckOut"
        test_command += " -only-testing:MyDemoAppUITestsNew/CartAndCheckoutFlowTests/testVerifyCheckOutWithEmptyCart"
        test_command += " -only-testing:MyDemoAppUITestsNew/ProductDetailsTests/testProductDetails"
        puts "Running multiple tests on Simulator #{destination} (Task #{index+1})"
        system(test_command)
      end
    end
    Process.waitall  # Wait for all the forks to finish
  end

  # Run the Regression tests
  desc "Run the Regression tests"
  task :run_regression_tests do
    # Parallel testing on both simulators
    [DESTINATION_1, DESTINATION_2].each_with_index do |destination, index|
      fork do
        scheme = "MyDemoAppUITestsNew(Regression)"
        test_command = build_test_command(scheme, destination)
        puts "Running Regression tests on Simulator #{destination} (Task #{index+1})"
        system(test_command)
      end
    end
    Process.waitall  # Wait for all the forks to finish
  end

  # Run the Smoke tests
  desc "Run the Smoke tests"
  task :run_smoke_tests do
    # Parallel testing on both simulators
    [DESTINATION_1, DESTINATION_2].each_with_index do |destination, index|
      fork do
        scheme = "MyDemoAppUITestsNew(Smoke)"
        test_command = build_test_command(scheme, destination)
        puts "Running Smoke tests on Simulator #{destination} (Task #{index+1})"
        system(test_command)
      end
    end
    Process.waitall  # Wait for all the forks to finish
  end

  # Run the Sanity tests
  desc "Run the Sanity tests"
  task :run_sanity_tests do
    # Parallel testing on both simulators
    [DESTINATION_1, DESTINATION_2].each_with_index do |destination, index|
      fork do
        scheme = "MyDemoAppUITestsNew(Sanity)"
        test_command = build_test_command(scheme, destination)
        puts "Running Sanity tests on Simulator #{destination} (Task #{index+1})"
        system(test_command)
      end
    end
    Process.waitall  # Wait for all the forks to finish
  end

  # Run Parallel tests in multiple simulators (Single Command)
  desc "Run parallel tests in multiple simulators (Single command)"
  task :run_parallel_tests do
    test_command = "xcodebuild test \
      -workspace '#{WORKSPACE}' \
      -scheme 'MyDemoAppUITests' \
      -destination 'platform=iOS Simulator,name=iPhone 16' \
      -destination 'platform=iOS Simulator,name=iPhone 16 Pro' \
      -only-testing:MyDemoAppUITests/LoginScenarioTests"
    
    puts "Running tests on multiple simulators..."
    system(test_command)
  end
end