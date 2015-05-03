class Notebook < ActiveRecord::Base
	belongs_to :user
	has_many :annotations
	validates :name, presence: true
end
