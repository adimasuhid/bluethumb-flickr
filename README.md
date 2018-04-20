# BlueThumb Flickr Search App

A simple app to search photos via Flickr. You can check out the app [here](https://bluethumb-flickr.herokuapp.com).


### Stack

- Ruby 2.5.0
- Rails 5.2.0
- Webpack 3.10.0

### Setup

Clone the application
```
git clone git@github.com:adimasuhid/bluethumb-flickr.git
```

Ask the owner for **Master Key** for the credentials and add it to the project
```
cp master.key path/to/project/bluethumb-flickr/config/
```

Start server
```
rails s
```

### Tests

Running specs
```
bundle exec rspec spec
```

### Assumptions
- Searching only free photos
- Based on Full text search of flickr itself (no filtering for potential unkindly and unrelated images)

### Improvements (when more time is allotted)
- Due to the results being directly from API, previous and next does not restore the original previous/next when a new image is added in Flickr
- Mobile Support

### Screenshots
![flickr bluethumb](https://user-images.githubusercontent.com/2517299/39042036-7ef872da-44bc-11e8-9672-a605b4151aa9.gif)

