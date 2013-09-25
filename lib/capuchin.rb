require 'dotenv'
Dotenv.load

require "capuchin/version"

require "date"
require "erb"
require "gibbon"
require "redcarpet"
require "yaml"

require "capuchin/markdown"
require "capuchin/email"
require "capuchin/scheduler"
require "capuchin/mailchimp"

module Capuchin; end
