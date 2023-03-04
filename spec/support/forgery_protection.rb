# frozen_string_literal: true

RSpec.configure do |config|
  # Enable CSRF protection during integration tests
  config.around :each, type: :feature do |example|
    initial = ActionController::Base.allow_forgery_protection

    ActionController::Base.allow_forgery_protection = true
    example.run
    ActionController::Base.allow_forgery_protection = initial
  end
end
