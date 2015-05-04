module API
  module V1
    class Annotations < Grape::API
      version 'v1'
      format :json

      resource :annotations do
        desc "Return list of annotations"
        get do
          Annotation.all
        end
      end
    end
  end
end