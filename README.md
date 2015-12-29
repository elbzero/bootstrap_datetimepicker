## Installation
Add these lines to your application's Gemfile:
```ruby
gem 'bootstrap_datetimepicker'
```

Then execute
```bash
$ bundle
```

To start using it in your Rails application, enable it via the asset pipeline.

If your server is running, you will need to __restart Rails__ before using the gem.

Add the following to your Javascript manifest file (`application.js`):
```javascript
//= require moment
//= require bootstrap-datetimepicker
//= require dates
//= require modernizr-inputtypes
```

Also, modify your `application.css`:
```css
*= require bootstrap-datetimepicker
```

## Usage
#### To use the date picker:
- Using simple form: use the date field with the html5 option turned on
  - Example: f.input :some_date, as: :date, html5: true
- Using rails helpers: use date\_field and date\_field\_tag
  - Example: date\_field\_tag "some\_date"
  - Example: date_field "user" "birthday"

#### To use the time picker:
- Using simple form: use the time field with the html5 option turned on
  - Example: f.input :some_time, as: :time, html5: true
- Using rails helpers: use time\_field and time\_field\_tag
  - Example: time\_field\_tag "some_time"
  - Example: time\_field "user" "favorite\_time"

#### To use the datetime picker:
- Using simple form: use the datetime_local field
  - Example: f.input :some\_datetime, as: :datetime\_local
- Using rails helpers: use datetime\_local\_field and datetime\_local\_field\_tag
  - Example: datetime\_local\_field\_tag "some_datetime"
  - Example: datetime\_local\_field "user" "birth_datetime"

## Development

### To Publish Gem Update
```
gem build bootstrap_datetimepicker.gemspec
gem push bootstrap_datetimepicker-0.0.2.gem
```

### Point Projects to Local Source Instead of Github

When refactoring and modifying code in this project while developing other projects, you may want your other project to point to the local source rather than the remote on Github. In your client project, you still need to keep the Gemfile pointing to the Github location but you can override your bundler setting like as follows:

`bundle config local.bootstrap_datetimepicker /Users/garyfoster/Documents/Projects/bootstrap_datetimepicker`

to undo this and revert to the remote github repository:

`bundle config --delete local.bootstrap_datetimepicker`
