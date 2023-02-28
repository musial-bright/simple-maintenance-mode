# Maintenance Mode

A simple maintenance mode gem for rails apps. If you need a mode/page for
maintenance purposes, this is a gem for you. It provides a simple maintenance
page, filter for your controllers and a fairly simple logic for 
activation/deactivation.

When activated, users will be redirected (maintenance_mode_check filter) to a
static maintenance mode page (**/maintenance** route). The maintenance mode settings
will be stored in a app settings model. Additionally each user will get a cookie
when the mode is active and a redirection to the maintenance page will happen.

To activate the maintenance mode simply run the rails console and do this:
**MaintenanceMode::Model::AppSettings.maintenance_mode = true**

As a rails app administrator, you will be always able to access the page by using
the **maintenance_mode_override=1** GET parameter.


## Installation

Add this line to your application's Gemfile:

    gem 'maintenance_mode'

And then execute:

    $ bundle
    $ rails g maintenance_mode:install

Or install it yourself as:

    $ gem install maintenance_mode
    
## Usage

Put this in your Application Controller
````
class ApplicationController <  ActionController::Base
  include MaintenanceMode::Filter
  before_action :check_maintenance_mode
end
````

You can get/set the maintenance mode with the following method
````
# get current maintenance mode
MaintenanceMode::Model::AppSettings.maintenance_mode
# will return true|false

# set maintenance mode
MaintenanceMode::Model::AppSettings.maintenance_mode = true|false
````
