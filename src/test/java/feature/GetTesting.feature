Feature: Test file for testing GET method for given API

  Background:
    * url 'https://jsonplaceholder.typicode.com/'
    * def expectedOutput = read('ResponseJson/responseGet.json')

  Scenario Outline: Verify that api is returning correct response for given postId
    Given path 'comments'
    And param postId = <postId>
    When method Get
    Then status 200
    And assert response.length == <length>
    And match response == <responseJson>
    And match responseHeaders['Content-Type'][0] == 'application/json; charset=utf-8'

    Examples:
    |postId|length|responseJson  |
    |1     |5     |expectedOutput|

   Scenario: Verify that api is empty response body on giving wrong postId
     Given path 'comments'
     And param postId = 'a'
     When method Get
     Then status 200
     And match response == []

   Scenario: Verify that api returning 404 on using wrong url
     Given path 'commentss'
     And param postId = 'a'
     When method Get
     Then status 404