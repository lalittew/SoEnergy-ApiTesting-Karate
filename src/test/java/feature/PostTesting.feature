Feature: Test file for testing POST method for given API

  Background:
    * url 'https://jsonplaceholder.typicode.com/'
    * def requestBody = read('RequestJson/request1.json')
    * def expectedPostResponse = read('ResponseJson/responsePost.json')

  Scenario Outline: Verify that api is able to post request successfully
    Given path 'posts'
    And request requestBody
    And set requestBody.title = <requestTitle>
    And set requestBody.body = <requestBody>
    And set requestBody.userId = <requestUserId>
    When method POST
    Then status 201
    And match response == <responsePostJson>
    And match response.title == <requestTitle>
    And match response.body == <requestBody>
    And match response.userId == <requestUserId>
    And assert response.id != null

  Examples:
    |requestTitle   |requestBody   |requestUserId|responsePostJson    |
    |'SoEnergyTitle'|'SoEnergyBody'| 2           |expectedPostResponse|

  Scenario Outline: Verify the user is able to send empty string as values for api request body
    Given path 'posts'
    And request requestBody
    And set requestBody.title = <requestTitle>
    And set requestBody.body = <requestBody>
    And set requestBody.userId = <requestUserId>
    When method POST
    Then status 201
    And match response.title == <requestTitle>
    And match response.body == <requestBody>
    And match response.userId == <requestUserId>
    And assert response.id != null

    Examples:
      |requestTitle   |requestBody   |requestUserId|
      |'          '   |'SoEnergyBody'| 2           |
      |'SoEnergyTitle'|'SoEnergyBody'| 2           |
      |'SoEnergyTitle'|'SoEnergyBody'| null        |