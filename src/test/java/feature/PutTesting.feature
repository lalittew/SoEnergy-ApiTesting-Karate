Feature: Test file for testing PUT method for given API

  Background:
    * url 'https://jsonplaceholder.typicode.com/'
    * def requestBody = read('RequestJson/request1.json')

  Scenario Outline: Verify that api is able to PUT(update) request successfully
    Given path 'posts/<id>'
    And request requestBody
    And set requestBody.title = <requestTitle>
    And set requestBody.body = <requestBody>
    And set requestBody.userId = <requestUserId>
    When method PUT
    Then status 200
    And match response.title == <requestTitle>
    And match response.body == <requestBody>
    And match response.userId == <requestUserId>
    And assert response.id == <id>

  Examples:
    |requestTitle   |requestBody   |requestUserId|id    |
    |'SoEnergyTitle'|'SoEnergyBody'| 2           |2     |