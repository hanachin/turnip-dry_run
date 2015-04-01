Feature: Attacking a monster
  Background:
    Given there is a monster called "Kijimun"

  Scenario: attack the monster
    When I change its name to "Kijimuna"
    Then it should be called "Kijimuna"
