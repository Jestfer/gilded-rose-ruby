Gilded Roses
=================

## Description
* Gilded Roses Tech Test

## User Stories
```
As a Guilded Rose team member
So that we can better maintain our codebase
I would like to get it refactored

As a Guilded Rose team member
So that we can accommodate new supplier needs into our codebase
I would like to get it refactored

As a Guilded Rose team member
So that we can start exporting conjured items
I would like to include them in our shop
```

## My approach
* To refactor this mess. I first decided to write tests to make sure the functionalities work as expected before making any major changes and refactor the codebase.
* Once all tests pass, I separated models into two different files (item and gilded_rose), to keep things cleaner and to create private methods in the GildedRose class.
* Time to refactor (without adding new functionalities).

At this point, I decided to provide two solutions for this exercise:
1. Extract the update_quality method logic (GildedRose class) into different private methods. Step by step, I made sure all tests were still passing after making small adjustments in my code. I started from the smallest if child and worked my way up to the top. I prioritised abstracting the logic while keeping the code extremely readable and as easy as possible to maintain. You can find the outcome in ```_gilded_rose_old.rb``` - You can also find the tests for this part under the following commit: ```5f6b863f3bb3a9441cf23a9366737c59abe0ad85```. Note: I am aware that the Items would need to be mocked as the GildedRose class needs to be tested in isolation, that was the next step, but due to time constraints, I decided to move into the final and more elegant solution and work on it.

2. After having a clearer idea on the different private methods, that provide a hint on what new objects (classes) can be created, it was time to come up with a more elegant solution following best practices.
As the Item class can not be modified due to the Goblin, I created a CommonItem class that would inherit from Item, and, then, the rest of the classes for every kind of special item would inherit from CommonItem.
The responsibility of the GildedRose class would be to take an array of different kind of items and iterate through them to allow them to run their own update_item method.

* Finally, I added the new ```conjured items``` functionality, also fully-tested.

## Next focus:
- If I had had more time, I would have provided a better project structure for the two different solutions to this exercise.
- Also, I would have liked to use the Text-based tests.