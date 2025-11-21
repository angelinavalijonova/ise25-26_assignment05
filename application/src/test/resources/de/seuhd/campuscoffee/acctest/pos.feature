Feature: Points of Sale Management
  This feature allows users to create and modify points of sale (POS).

  Scenario: Insert and retrieve two POS
    Given an empty POS list
    When I insert POS with the following elements
      | name                   | description                      | type            | campus    | street          | houseNumber  | postalCode | city       |
      | Schmelzpunkt           | Great waffles                    | CAFE            | ALTSTADT  | Hauptstraße     | 90           | 69117      | Heidelberg |
      | Bäcker Görtz           | Walking distance to lecture hall | BAKERY          | INF       | Berliner Str.   | 43           | 69120      | Heidelberg |
      | New Vending Machine    | Use only in case of emergencies  | VENDING_MACHINE | BERGHEIM  | Teststraße      | 99a          | 12345      | Other City |
    Then the POS list should contain the same elements in the same order

  Scenario: Update one of three existing POS
    Given the following POS already exist
      | name                | description     | type            | campus    | street        | houseNumber | postalCode | city       |
      | POS A               | Old description | CAFE            | ALTSTADT  | Straße 1      | 1           | 69117      | Heidelberg |
      | POS B               | Old description | BAKERY          | INF       | Straße 2      | 2           | 69120      | Heidelberg |
      | POS C               | Old description | VENDING_MACHINE | BERGHEIM  | Straße 3      | 3           | 12345      | Karlsruhe  |
    When I update the POS "POS B" with the description "Fresh bakery goods"
    Then the POS "POS B" should have the description "Fresh bakery goods"