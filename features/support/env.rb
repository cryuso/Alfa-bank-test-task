require 'capybara/cucumber'
require 'selenium-webdriver'
require 'webdrivers'

Capybara.register_driver :driver do |app|
  case ENV['DRIVER']
  when 'chrome'
    Capybara::Selenium::Driver.new(app, :browser => :chrome)
    else 'without_browser'
    Capybara.default_driver = :mechanize
  end
end

Capybara.default_driver   = :driver
Capybara.default_selector = :xpath