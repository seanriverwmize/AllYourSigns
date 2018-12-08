class Subject < ApplicationRecord
  belongs_to :user
  zodiac_reader :birthday
end
