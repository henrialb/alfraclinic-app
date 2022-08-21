class Challenge < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  enum category: %i[strength velocity resistance]
  enum result_unit: %i[un cal minutes cm]

  scope :archived, -> { where(archived: true) }
  scope :not_archived, -> { all - archived }
end
