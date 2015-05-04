# lib/api/root.rb
module API
  class Root < Grape::API
    prefix 'api'
    mount API::V1::Root
    error_formatter :json, API::ErrorFormatter
    # mount API::V2::Root (next version)
  end
end