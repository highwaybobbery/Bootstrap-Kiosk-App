Bootstrap an App with Constant Contact 
==========

a proof of concept for a kiosk app to add users to a mailing list or check them in at an event 

==========
Steps for setting up the basic app 

1) it will utilize AppConnect  - Constant Contact's Developer API
Developers will need to setup a Mashery Account to get an API key :

https://constantcontact.mashery.com/io-docs

the file developerFlow.doc in this repository contains instructions for signing up for both Mashery and a Constant Contact trail account, including the step for linking them.

3) This repository contains the basic framework for the Application, including the login.

~ Get List ?
~ Add to List ? 
~ Get the basic app framework uploaded to this repo ( including API key ) 

Goals of the Exercise : 

1) replicate the sign-up form 

2) thank you page 

3) automatic return to form upon submit 

4) bonus round - create an event signup option


# Setup

1. Fork this repo from github
2. Clone your fork to your local machine.
3. Copy the config/initializers/_secret_tokens.rb.example file to _secret_tokens.rb
 (note this file is git-ignored so you don't accidently put your private keys on github)
4. Open config/initializers/_secret_tokens.rb in your editor of choice
5. Run: 'bundle install'
6. Run: 'rake db:migrate'
7. Run 'rake secret' to generate a new rails secret key.
8. Paste this key into the _secret_tokens.rb file on the line for 'BootstrapKioskApp::Application.config.secret_key_base
9. Sign up for an API key through mashery:
https://constantcontact.mashery.com/
10. Create a new application by clicking API Keys, then Applications
 ** Make sure to enter the following as the 'Redirect URI for OAuth calls'
http://localhost:3000/users/auth/constantcontact/callback
11. Enter the api key and secret key into the _secret_tokens.rb file.
12. Register for a ConstantContact account, and verify your account email address
13. Start your rails server with rails s
14. Click 'sign in'
15. Enter your constantcontact login information * your username should be the email address you signed up with *

You should now be a all set up!

Keep in mind that if other people work on your app they will need a copy of your _secret_tokens file, which should not be in github.
