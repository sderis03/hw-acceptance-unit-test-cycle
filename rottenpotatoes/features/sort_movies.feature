Feature: sort movies

  As a movie buff
  So that I can find movies sorted
  I want to sort alphabetically by name and chronologically by release date

Background: movies in database

  Given the following movies exist:
  | title        | rating | director     | release_date |
  | Star Wars    | PG     | George Lucas |   1977-05-25 |
  | Blade Runner | PG     | Ridley Scott |   1982-06-25 |
  | Alien        | R      |              |   1979-05-25 |
  | THX-1138     | R      | George Lucas |   1971-03-11 |
  
  
  
  
Scenario: Restrict movies by ratings
  Given I am on the home page
  When I check the following ratings: PG
  And I uncheck the following ratings: R G PG-13
  When I press "Refresh"
  Then I should see the following movies: Star Wars, Blade Runner
  And I should not see the following movies: Alien, THX-1138
  
Scenario:sort movies alphabetically
  Given I am on the home page
  When I follow "Movie Title"
  Then I should see "Blade Runner" before "Star Wars"
  And I should see "Alien" before "Blade Runner"
  
Scenario: sort movies in increasing order of release date
  Given I am on the home page
  When I follow "Release Date"
  Then I should see "Star Wars" before "Blade Runner"
  And I should see "THX-1138" before "Alien"
  
Scenario: I want to see every movie
  Given I am on the home page
  Then I should see all the movies
  
#This works (below)  
Scenario: add new movie
  Given I am on the home page
  When I follow "Add new movie"
  When I fill in "Finding Nemo" for "Title"
  When I press "Save Changes"
  Then I should see "Finding Nemo"
  
Scenario: delete movie
  Given I am on the home page
  When I follow "More about Star Wars"
  Then I press "Delete"
  Then I should see "Movie 'Star Wars' deleted."