# Danny Le's ObjectSecurity Coding Challenge

## Table of contents
* [General info](#general-info)
* [Dependencies](#technologies)
* [Installation](#Installation)
* [Approach](#approach)
* [Execution](#execution)
* [Testing](#Testing)


## General info
This project contains the solutions to ObjectSecurity LLC. coding challenge. The solution consists of tree structure and algorithms for constructing, search, and tree analysis.


The project's source code can be found within the main directory.

Program's core execution code is located in `main.rb`

All core modules and classes and methods are stored in `tree.rb` and `jsonHelper.rb`.
	
## Dependencies
Project is created with:
* Homebrew version: 2.5.7
* Ruby version: 2.5.0
* JSON gem 2.1.0

Test dataset
* data.json

	
## Installation
To install project's dependencies, install it locally using Ruby Version Manager (RVM):

```
rvm install 2.5.0
ruby <path-to-directory>/main.rb
```

## Approach
1. Create method for loading JSON data file as hashmap.
2. Construct tree class along with required attributes
3. Created helper methods for analysis.
4. Created method depth-first-search
5. Created method for breath-first-search
6. Simple unit test to validate methods' functionality and outputs

## Execution

The analysis and results can be viewed by 

running `ruby <path-to-directory>/main.rb` locally.

## Testing

Unit test cases are written using Ruby's built-in `MiniTest` gem to validate methods' functionality and results.

All unit tests can be executed by running the command within the main directory.

## Future Improvements

1. Add integration tests.
