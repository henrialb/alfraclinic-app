class Athlete < ApplicationRecord
  validates :name, presence: true

  enum level: [:amateur, :professional]
end
