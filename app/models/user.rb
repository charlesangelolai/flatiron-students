class User < ApplicationRecord
  belongs_to :cohort
  belongs_to :role
  has_many :projects
  has_many :survey_responses, through: :projects
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable
  
  accepts_nested_attributes_for :cohort, reject_if: :all_blank
end
