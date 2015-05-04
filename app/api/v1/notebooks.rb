module API
  module V1
    class Notebooks < Grape::API
      version 'v1'
      format :json

      resource :notebooks do
        desc "Return list of notebooks"
        get do
          Notebook.all
        end
      end
    end
  end
end