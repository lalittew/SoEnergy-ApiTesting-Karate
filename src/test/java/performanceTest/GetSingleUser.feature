Feature: Test file for testing GET method for given API

  Background:
    * url 'https://jsonplaceholder.typicode.com/'
    * def expectedOutput = read('ResponseJson/responseGet.json')

  Scenario: Verify that api is returning correct response for given postId
    Given path 'comments'
    And param postId = <postId>
    When method Get
    Then status 200