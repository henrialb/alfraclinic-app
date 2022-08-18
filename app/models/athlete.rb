class Athlete < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  enum level: [:amateur, :professional]
  enum archived: [:false, :true]
end
