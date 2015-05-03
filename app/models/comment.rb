class Comment < ActiveRecord::Base
  belongs_to :annotation
  belongs_to :user
end
