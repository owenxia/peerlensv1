class Annotation < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	validates :note, presence: true
end
