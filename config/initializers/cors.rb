# frozen_string_literal: true

# config/initializers/cors.rb
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'localhost:3001'  # Adjust this if your frontend is on a different domain or port
    resource '*',
             headers: :any,
             methods: %i[get post put patch delete options head]
  end
end
