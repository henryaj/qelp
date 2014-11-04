# qelp

A little Yelp clone. Built using Ruby on Rails, with testing from RSpec and Capybara. Postgres is the database of choice here. This was the foundation on which [Railstagram](https://github.com/henryaj/railstagram) was built, which is much more impressive (both technically and aesthetically).

I subsequently wrote the course material for this section of the Makers Academy course based on what I'd learned about Rails, the MVC design pattern, Postgres, testing with RSpec and Poltergeist, Devise and OmniAuth, Paperclip, and S3.

The course notes were based on the notes I took during this part of the course, which you can see [here](https://github.com/henryaj/makers-notes/blob/master/rails.md).

## Technologies

* Ruby on Rails
* Postgres
* Devise
* Paperclip and Imagemagick
 
#### Testing

* RSpec
* Capybara
* Poltergeist/PhantomJS

#### Design patterns

* MVC
* separation of concerns
* single responsibility principle

### Tests

```
endorsing reviews
  a user can endorse a review, which updates the review endorsement count
  a user cannot endorse a review if they are not logged in

restaurant reviews
  displaying reviews
    should be able to have a review
    should have all its reviews printed on its page
  creating reviews
    there should be a link to a write review page on each restaurant page
    the write review page should have a form on it
    users should not be able to submit reviews with ratings over 5
    when submitted, I should be on the restaurant page and see the review there

Review
  has a rating that is not more than 5

Restaurant
  is not valid when name is fewer than three characters
  should know its average rating with one review
  each restaurant can have an image
  should know its average rating with one review
  restaurant name is invalid if it is not unique
  has a user who created it
  should know its average rating with two reviews

restaurant
  without any restaurants
    should display a prompt to add a restaurant
  creating restaurants
    there should be a form to submit a new restaurant
    when the form is filled in and submitted, a new restaurant should appear on the restaurants page
    restaurants cannot have a name shorter than three characters
  viewing restaurants
    each restaurant should have its own page
    the page of each restaurant should have its name, description and its average rating
    the homepage should show each restaurant and include its rating
  there are restaurants
    should show one restaurant
  uploading images
    restaurants can have an image a restaurant's image shows up on the home page
    a restaurant's image shows up on the restaurant show page
  deleting restaurants
    a user should be able to delete a restaurant
```
