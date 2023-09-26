
if ENV['RAILS_ENV'] == 'test'
  require 'simplecov'
  SimpleCov.start 'rails' do
    add_filter 'spec/'
    add_filter 'config/'
  end
end
