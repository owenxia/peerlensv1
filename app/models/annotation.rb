class Annotation < ActiveRecord::Base
	belongs_to :user
	belongs_to :notebook
	has_many :comments, dependent: :destroy
	validates :note, presence: true
end
