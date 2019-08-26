# encoding: utf-8
@create_reserve

Feature:  purchase flow from an online reservation

As a new user
I want to search for air tickets
In order to make a purchase of reservation 

Scenario Outline: Purchase flow of reservation for air tickets 
    Given I have successfully navigated to the Viajanet
    When  I fill in the data going to "<destination>" and do a search
    And   I fill in the date to start and 
    And   I choose a result of flight
    And   I fill in the passenger and payment data
    Then  I validate the processing of purchase
Examples:
|destination         | 
|national flight     |
|international flight|
