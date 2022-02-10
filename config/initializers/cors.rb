require 'rack'

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'http://localhost:3000'
    resource '/purchases',
   headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end