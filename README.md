# Sinatra: green way.

Sinatra is one of the most popular micro frameworks for ruby,its a easy and
quickly way to create web applicatios.

Cucumber is an powerful tool to create user stories and accpetance tests

Together they are an quickly and efficient way to create web applications.

In this post we'll create our first sinatra application in 'outside-in' development with cucumber, I mean, in the green way.

# First Sinatra application.

First of all we need to create an our basic environment.
I like use one gemset per project [ for rvm an how to use it see 'pancho blog link' ]
Then we need create the application's directory called greenway. Navigate to that
directory and create a file called Gemfile. Edit this file so its looks like
the example below:

    source 'http://rubygems.org'
    
    gem 'sinatra'
    gem 'cucumber'
    gem 'cucumber-sinatra'
    gem 'capybara'
    jem 'rspec'

Now we can install our gems
{% highlight ruby %}
    bundle install
{% endhighlight %}

> if you doesn't have installed bundle. Install it with
{% highlight ruby %}
    gem install bundler
{% endhighlight %}

Now we need to create or sinatra application, configure cucumber, define
the web_steps and so on. Well go ahead

{% highlight %}
    cucumber-sinatra init --app Hello src/hello.rb
{% endhighlight %}

Done! cucumber-sinatra is a gem that do most of the configuration work for us. [ for
more info see github repo page ]

## Write tests

Now we can write our cucumber test, yes, I said test

Inside features directory create a new file called hello.feature
In this file write something like:

{% highlight Gherkin linenos %}
Feature: Cucumber web testing
  In Order to verify if my app works
  As A developer
  I want to see my home page

  Scenario: View hello page
    Given I am on the home page
    Then I should see "It's alive!"
{% endhighlight %}

Then run the test:

{% highlight %}
    cucumber feature/hello.feature
{% endhighlight %}

![Red tests](https://github.com/ovargas27/sinatra-green_way/blob/master/sinatra_red_tests.jpg?raw=true)

And... Fail!
No worry, this is espected. Now we are ready to write code to pass the test.

## Write Code

This is the moment to write the code to pass the test. Open the file src/hello.rb and edit it to look like the following

{% highlight ruby linenos %}
    require 'sinatra/base'

    class Hello < Sinatra::Base
      get '/' do
        "It's alive!"
    end
{% endhighlight %}

And run the test again 

{% highlight ruby %}
    cucumber feature/hello.feature
{% endhighlight %}

![Green tests](https://github.com/ovargas27/sinatra-green_way/blob/master/sinatra_green_tests.jpg?raw=true)

We're green. If you want to see your web application, you can do it with

{% highlight ruby %}
   rackup -p 4567
{% endhighlight %}

Now you can visit it on "localhost:4567/" in your browser

Congrats for you first Sinatra application in the green way.
