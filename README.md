# String Calculator Kata

A simple TDD Kata, a test-first coding exercise.

A Kata is a small, fun problem that shouldn't take more than one or two hours to solve in your favorite language (Ruby in my case).
The rule is that you should repeat the exercise, and every time try to improve not only code you end up with, but also the process by which you get to it.

Credits to [Roy Osherove](http://osherove.com/tdd-kata-1) for designing this kata.

## Installation

```bash
$ gem install bundler
$ bundle install # Installs RSpec
```

Further dependencies for your project can be added via [Gemfile](https://bundler.io).

## Running Specs

Tests (or specs) are located in `/spec` directory. To run them you can just run `rspec`, but it's better to prepend it with Bundler's `bundle exec` command to execute `rspec` in the context of your bundle, which is specified in the Gemfile (in other words, it helps using the right version of the gems present in the Gemfile).

```bash
$ bundle exec rspec
```

## Before you start
* Try not to read ahead.
* Do one task at a time. The trick is to learn to work incrementally.
* Make sure you only test for correct inputs. There is no need to test for invalid inputs for this kata.

## The kata

### Step 1: the simplest thing
Create a simple String calculator with a method ``int add(String numbers)``.

* The string argument can contain 0, 1, or 2 numbers, and will return their sum (for an empty string it will return 0) for example ``""`` or ``"1"`` or ``"1,2"``.
* Start with the simplest test case of an empty string and move to 1 and two numbers.
* Remember to solve things as simply as possible so that you force yourself to write tests you did not think about.
* Remember to refactor after each passing test.

### Step 2: handle an unknown amount of numbers
Allow the ``add()`` method to handle an unknown amount of numbers.

### Step 3: handle new lines between numbers
Allow the ``add()`` method to handle new lines between numbers (instead of commas).

* the following input is ok:  ``"1\n2,3"`` (will equal 6)
* the following input is NOT ok:  ``"1,\n"`` (not need to prove it - just clarifying)

### Step 4: support custom delimiters
Support custom delimiters: to change a delimiter, the beginning of the string will contain a separate line that looks like this: `"//DELIMITER"`

For example `"//;\n1;2"` should return 3 where the default delimiter is `";"`.

The first line is optional.
All existing scenarios should still be supported.

### Step 5: negative numbers
Calling ``add()`` with a negative number will throw an exception ``"negatives not allowed"`` - and the negative that was passed.

For example ``add("1,4,-1")`` should throw an exception with the message ``"negatives not allowed: -1"``.
If there are multiple negatives, show all of them in the exception message.

### Step 6: ignore big numbers
Numbers bigger than 1000 should be ignored, so adding 2 + 1001  = 2

### Step 7: handle delimiters of any length
Delimiters can be of any length with the following format:  `//[DELIMITER]\n` for example: `//[***]\n1***2***3` should return 6

### Step 8: allow multiple delimiters
Allow multiple delimiters like this:  `//[delim1][delim2]\n` for example `//[*][%]\n1*2%3` should return 6

### Step 9: handle multiple delimiters of any length
Allow multiple delimiters like this:  `//[delim1][delim2]\n` for example `//[**][%%%]\n1**2%%%%3` should return 6

### Step 10: Celebrate!
🎉🎉🎉 You did it! 🎉🎉🎉
