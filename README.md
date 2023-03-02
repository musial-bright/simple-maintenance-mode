# Simple Maintenance Mode

A simple maintenance mode gem for rails apps. If you need a mode/page for
maintenance purposes, this is a gem for you. It provides a simple maintenance
page, filter for your controllers and a fairly simple logic for 
activation/deactivation.

When activated, users will be redirected (maintenance_mode_check filter) to a
static maintenance mode page (**/maintenance** route). The maintenance mode settings
will be stored in a app settings model. Additionally each user will get a cookie
when the mode is active and a redirection to the maintenance page will happen.

## Usage

### Activating/deactivating the maintenance mode
To activate the maintenance mode simply run the rails console and do this:
**SimpleMaintenanceMode::Model::AppSettings.maintenance_mode = true**

### Overriding maintenance mode for adminis
As a rails app administrator, you will be always able to access the page by using the **maintenance_mode_override=1** GET parameter. This will set a cookie and allow administrators to see the app without beeing redirected to the maintenance page. To activate the override access you webapp similar to this: `https://<you-app-domain>/?maintenance_mode_override=1`. 

To remove the override, simply delete the `maintenance_mode_override` cookie.


## Installation

Add this line to your application's Gemfile:

    gem 'simple-maintenance-mode'

And then execute:

    $ bundle
    $ rails g simple_maintenance_mode:install

Or install it yourself as:

    $ gem install simple-maintenance-mode
    
## Usage

Put this in your Application Controller
````
class ApplicationController <  ActionController::Base
  include SimpleMaintenanceMode::Filter
  before_action :check_maintenance_mode
end
````

You can get/set the maintenance mode with the following method
````
# get current maintenance mode
SimpleMaintenanceMode::Model::AppSettings.maintenance_mode
# will return true|false

# set maintenance mode
SimpleMaintenanceMode::Model::AppSettings.maintenance_mode = true|false

# use content for custom contents, i.e.
SimpleMaintenanceMode::Model::AppSettings.content.maintenance_info = {
    title: 'This website is in maintenance',
    message: 'The maintenace will take 10min.'
}
# later you can use it in 
````
