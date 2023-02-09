I wanted to create an authentication system for my Rails API, but one thing about APIs (with no client) is that you can't use sessions or cookies for authentication.
So instead, I used the gem devise_token_auth, which uses tokens. Put simply, this is how it works: when you make HTTP requests to sign up or log in, the response headers give you authentication tokens, which you send in subsequent HTTP requests' headers to prove that you're authenticated.

While the official docs provide most of the information you need, there were a few points that I found confusing so I'm leaving this article for future reference. Hope it helps!

Note: Guide is for Linux or MacOS.

# Implementation Steps
Please also feel free to check out the bare-bones [repository](https://127.0.0.1) I created, as a proof of concept for how to use this gem. 

# 1. Install devise_token_auth

Add the following to your Gemfile, then run bundle from your command line:

`gem 'devise_token_auth'`

# 2. Generate necessary files

Execute this from your command line.

`rails g devise_token_auth:install User auth`

# 3. Migrate You Database
`rails db:migrate`

# 4. Configure your initializer file (very important)

Go to your config/initializers/devise_token_auth.rb file (also created in the rails g command in step #2).

`config.change_headers_on_each_request = false`

#  Actual Usage

I mentioned earlier that the HTTP request for signing up users is a POST request to localhost:3000/auth/. As for the full list of methods (e.g. logging users in/out, and changing their passwords), please refer to the docs. You can see what request type, route, and parameters are required.

Finally, let's talk about actual usage. Here are the steps involved:

    Send authentication request (sign up or sign in)
    Status 200 is returned, with valid authentication tokens in the headers
    In your next request, send those tokens in your headers

The required token categories are:

    access-token
    client
    uid

It's that simple!

I wanted to also discuss tips for testing, but since this is getting long, I will write that in a separate post. Thanks for reading :)