# == Schema Information
#
# Table name: comments
#
#  id            :integer          not null, primary key
#  name          :string
#  body          :text
#  annotation_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :integer
#
# Indexes
#
#  index_comments_on_annotation_id  (annotation_id)
#

class Comment < ActiveRecord::Base
  belongs_to :annotation
  belongs_to :user
end
