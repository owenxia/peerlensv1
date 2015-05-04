module API
  module V1
    class Root < Grape::API
	    mount API::V1::Annotations
	    mount API::V1::Comments
	    mount API::V1::Notebooks
	    mount API::V1::Users
	    error_formatter :json, API::V1::ErrorFormatter

    end
  end
end

