class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :annotations, dependent: :destroy
  has_many :notebooks, dependent: :destroy
  has_many :comments, dependent: :destroy
end
