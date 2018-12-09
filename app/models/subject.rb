class Subject < ApplicationRecord
  belongs_to :user
  zodiac_reader :birthday
  validates :name, :birthday, presence: true
end
