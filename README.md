# Scrabble Sinatra

We are going to use the functionality that we implemented in our Scrabble projects using the new Sinatra functionality we have learned.

## Setup

You'll be working on this assignment with a pair.  
Choose one person to fork and clone the repo.  
Add the second individual as a collaborator to the forked repo.  
Both individuals will clone the forked repo: $ git clone [YOUR FORKED REPO URL]  

## Breakfast
- Create a new Sinatra application with a home page that contains a link to a score page (route & view).
- The score page will include a form that contains one text input. This form will `POST` the word for scoring. The calculated score is then returned and displayed to the user.

## Lunch
- Create a new page (route & view) which will allow the user to score multiple words.
  - This functionality should use the Scrabble functionality that scored an array of words.

## Dinner
- Modify the Lunch form to include radio buttons that will change the way the words are scored. The user can choose which piece of information has the highest weight:
  - 7-letters highest (the default from the original project)
  - Shortest word always (will outweigh 7-letters)

## Dessert
- Implement a GET route that is equivalent to the form created for Breakfast.
  - Hint: Think about idempotency; how could the breakfast functionality be implemented in a way that is idempotent?
