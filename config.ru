require 'rubygems'
require 'bundler'
Bundler.require

# Models
require './models/lawyer'

# Controllers
require './app'

use Rack::MethodOverride
run LawyersApp