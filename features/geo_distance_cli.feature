Feature: Food
  In order to find nearest customers
  As a CLI
  I want to process file with customer data providing location coordinates and radius in meters

  Scenario: Valid parameters are provided
    Given I use a fixture named "files"
    When I run `geo_distance get_customers_in_radius valid_customers.txt 53.339428 -6.257664 100000`
    Then the output should contain "Lisa Ahearn"
    Then the output should not contain "Ian McArdle"

  Scenario: Invalid location latitude and longitude parameters are provided
    Given I use a fixture named "files"
    When I run `geo_distance get_customers_in_radius valid_customers.txt IN VALID 100`
    Then the output should contain "invalid value for Float()"

  Scenario: Invalid radius parameter is provided
    Given I use a fixture named "files"
    When I run `geo_distance get_customers_in_radius valid_customers.txt 1 1 INVALID`
    Then the output should contain "invalid value for Float()"

  Scenario: Empty customer file is provided
    Given I use a fixture named "files"
    When I run `geo_distance get_customers_in_radius empty.txt 1 2 3`
    Then the output should not contain anything

  Scenario: Customer file with invalid JSON is provided
    Given I use a fixture named "files"
    When I run `geo_distance get_customers_in_radius invalid_json.txt 1 2 3`
    Then the output should contain "JSON::ParserError"
    Then the output should contain "Parsing error occurred for row: INVALID"

  Scenario: Customer file with invalid data is provided
    Given I use a fixture named "files"
    When I run `geo_distance get_customers_in_radius invalid_customers.txt 1 2 3`
    Then the output should contain "ArgumentError"
    Then the output should contain "Invalid data in row"
