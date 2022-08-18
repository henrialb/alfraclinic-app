class Athlete < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  enum level: %i[amateur professional]

  scope :archived, -> { where(archived: true) }
  scope :not_archived, -> { all - archived }
end
