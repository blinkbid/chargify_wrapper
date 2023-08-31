# frozen_string_literal: true

require "active_resource"
require "active_support/time"
require "chargify_wrapper/config"
require "chargify_wrapper/version"
require "chargify_wrapper/resources/base"
require "chargify_wrapper/resources/subscription"

Time.zone = "UTC"
ActiveSupport.parse_json_times = true
