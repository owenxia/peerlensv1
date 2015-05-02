class Annotation < ActiveRecord::Base
	validates :note, presence: true
end
