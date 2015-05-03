# == Schema Information
#
# Table name: annotations
#
#  id          :integer          not null, primary key
#  quote       :text
#  note        :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#  notebook_id :integer
#
# Indexes
#
#  index_annotations_on_notebook_id  (notebook_id)
#

class Annotation < ActiveRecord::Base
	belongs_to :user
	belongs_to :notebook, dependent: :destroy
	has_many :comments, dependent: :destroy
	validates :note, presence: true
	validates :notebook_id, presence: true
end
