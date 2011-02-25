# Sinatra: green way.

Sinatra is one of the most popular micro frameworks for ruby,its a easy and quickly way to create web applicatios.

Cucumber is an powerful tool to create user stories and accpetance tests

Together they are an quickly and efficient way to create web applications.

In this post we'll create our first sinatra application in 'outside-in' development with cucumber, I mean, in the green way.

## First Sinatra application.

First of all we need to create an our basic environment.
I like use one gemset per project 
Then we need create the application's directory called greenway. Navigate to that
directory and create a file called Gemfile. Edit this file so its looks like
the example below:

    source 'http://rubygems.org'
    
    gem 'sinatra'
    gem 'cucumber'
    gem 'cucumber-sinatra'
    gem 'capybara'
    gem 'rspec'

> I like to use one gemset per project. If you don't know rmv. What are you waiting for? [quick rvm tutorial](http://blog.crowdint.com/2010/07/28/getting-started-with-rvm.html)

Now we can install our gems
    bundle install

> if you doesn't have installed bundle. Install it with
    gem install bundler

Now we need to create or sinatra application, configure cucumber, define the web_steps and so on. Well go ahead

    cucumber-sinatra init --app Hello src/hello.rb

Done! cucumber-sinatra is a gem that do most of the configuration work for us. For more info you can visit [cucumber-sinatra](https://github.com/bernd/cucumber-sinatra)

### Write tests

Now we can write our cucumber test, yes, I said test

Inside features directory create a new file called hello.feature
In this file write something like:

    Feature: Cucumber web testing
      In Order to verify if my app works
      As A developer
      I want to see my home page

      Scenario: View hello page
        Given I am on the home page
        Then I should see "It's alive!"

Then run the test:
    cucumber feature/hello.feature

![Red tests](https://github.com/ovargas27/sinatra-green_way/blob/master/sinatra_red_tests.jpg?raw=true)

And... Fail!
No worry, this is espected. Now we are ready to write code to pass the test.

### Write Code

This is the moment to write the code to pass the test. Open the file src/hello.rb and edit it to look like the following

    require 'sinatra/base'

    class Hello < Sinatra::Base
      get '/' do
        "It's alive!"
    end

And run the test again 
    cucumber feature/hello.feature

![Green tests](https://github.com/ovargas27/sinatra-green_way/blob/master/sinatra_green_tests.jpg?raw=true)

We're green. If you want to see your web application, you can do it with
   rackup -p 4567

Now you can visit it on "localhost:4567/" in your browser

Congrats for you first Sinatra application in the green way. To celebrate, I left you with [Frank](http://www.youtube.com/watch?v=Aht9hcDFyVw)

# References
[Cucumber](http://cukes.info/) Behavior Driven Development tool.

[Siantra](http://www.sinatrarb.com/) a DSL for quickly creating web applications in Ruby.

[Cucumber-Sinatra](https://github.com/bernd/cucumber-sinatra) helpful gem to initialize a cucumber environment for a sinatra application.

