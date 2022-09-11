class Challenge < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  # Only allow deleting a challenge if it is archived
  before_destroy :abort_destroy, unless: :archived?

  enum category: { strength: 0, speed: 1, resistance: 2, power: 3 }

  enum result_unit: { reps: 0, centimeters: 1, seconds: 2, meters_per_second: 3 }

  scope :archived, -> { where(archived: true) }
  scope :not_archived, -> { all - archived }

  private

  def abort_destroy
    errors.add :base, "an active challenge can't be deleted"
    throw(:abort)
  end
end
