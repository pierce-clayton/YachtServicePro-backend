# Yacht Service Pro Backend

## Table of Contents

* [Intro](#intro)

* [Models](#models)

* [Controllers](#controllers)

* [Routes](#routes)

* [User Auth](#user-auth)

## Intro

This is the backend service that allows the stripe API to provide secure transactions for the front end service, in addition to providing a customer, product, and price database with Stripe object integration. All models are made with the corresponding Stripe object in mind so that the implemenataion stays as straightforward and close to the Stripe documents as possible. This project leans heavily on Stripe for the security of transactions and all best practices were followed as best as I could interpret them.

The other notable part is the fluff. I used the full Rails scaffold for all of my models and the corresponding views and controllers are still wired up. I left these on purpose because it rapidly sped up the development by allowing me to input data to the backend directly before I had a functional front end. In full production, this would all be removed for a more direct api with no side channels.

## Models

The models in ths project are only database placeholders. The main logic for implementing the stripe functionality is the controller. This would be one of the first places that I would start refactoring this codebase to move most of the logic from the controllers to the models. I understand that a popular paradigm is to have a skinny controller and fat model and this project is the opposite of that for now.

## Controllers

This project started as a User Authorization template I created from another tutorial. Instead of a User controller, it uses a registration and session controller to handle logins and session management. Since the tutorial put most of the logic for the Users in these separate controllers (and broke conventions which made things more complex), I followed suit with the creation of all the Stripe objects. My goal with these controllers was to make proxy Stripe objects that I could manipulate as close to the Stripe docs as I could. In my view, this kept the complexity low and made the concepts easier for me to see and understand.

## Routes

I found the Rails `resources` to be flexible enough to give me the routes I needed and allowed me to trim the ones I wanted to close off. I had no real need to write custom routes except a couple of login handlers and root route. Rails made this part very simple.

# User Auth

This project was created from a template made available [here](https://www.youtube.com/watch?v=FwfsMv2kSX4). The basics are there are Session and Registrion controllers to handle the login and creation of new users, respectively.

Once a user registers or logs in, the respective controller set the `current_user` variable in Ruby, which becomes available app wide. This is used to determine if backend resources are maed available to the front end.