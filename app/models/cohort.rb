class Cohort < ApplicationRecord
  # include PublicActivity::Model
  # tracked owner: ->(controller, model) { controller && controller.current_user }

  has_many :users

  validates :name, presence: true, uniqueness: true
  validates :program, presence: true
  validates :time, presence: true
end
