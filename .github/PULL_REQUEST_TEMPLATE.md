<!-- EVERYTHING WRAPPED IN < > SHOULD BE REPLACED  -->

[<Ticket name>](<Ticket link>)

### Feature

<!-- DESCRIBE THE PROBLEM OR REQUEST THAT RESULTED IN THIS
PULL REQUEST. THEN, DESCRIBE YOUR SOLUTION AND/OR THE
DECISIONS YOU MADE. -->

### Setup

<!-- ANY SPECIAL SETUP REQUIRED TO RUN YOUR CODE -->

### Q & A

<!-- HOW TO TEST YOUR CODE -->

<!-- SCREENSHOTS GOES HERE. IT IS A GOOD THING TO LABEL THEN
PROPERLY SO THE REVIEWER WILL KNOW WHAT THEY ARE ILLUSTRATING -->

<!-- Create a script test.rb 
```
require 'chargify_wrapper'
require "httplog"

ChargifyWrapper.configure do |config|
  config.subdomain = 'your-subdomain'
  config.api_key = 'your-api-key'
end

subscription = ChargifyWrapper::Subscription.find(subscription_id)
subscription.delayed_cancel('script test', 123)
```
and run `ruby test.rb`
-->

<!-- NOTES -->

<!-- DO NOT FORGET TO LABEL YOUR PULL REQUES -->
<!-- IF A NEW SCRIPT OR RAKE TASK IS REQUIRED IN AN UPCOMING
DEPLOY, DO NOT FORGET TO ADD IT INTO YOUR TICKET -->
