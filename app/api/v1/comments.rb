module API
  module V1
    class Comments < Grape::API
      version 'v1'
      format :json

      resource :comments do
        desc "Return list of comments"
        get do
          Comment.all
        end
      end
    end
  end
end