class Challenge < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  # Only allow deleting a challenge if it is archived
  before_destroy :abort_destroy, unless: :archived?

  enum category: %i[strength velocity resistance]
  enum result_unit: %i[un cal minutes cm]

  scope :archived, -> { where(archived: true) }
  scope :not_archived, -> { all - archived }

  private

  def abort_destroy
    errors.add :base, "an active challenge can't be deleted"
    throw(:abort)
  end
end
