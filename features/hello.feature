Feature: Cucumber web testing
  In Order to verify if my app works
  As A developer
  I want to see my home page

  Scenario: View hello page
    Given I am on the home page
    Then I should see "It's alive!"
