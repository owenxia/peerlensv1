# == Schema Information
#
# Table name: notebooks
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#

class Notebook < ActiveRecord::Base
	belongs_to :user
	has_many :annotations
	validates :name, presence: true
end
