class Athlete < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  # Only allow deleting an athlete if they are archived
  before_destroy :abort_destroy, unless: :archived?

  enum level: {
    amateur: 0,
    professional: 1
  }

  scope :archived, -> { where(archived: true) }
  scope :not_archived, -> { all - archived }

  private

  def abort_destroy
    errors.add :base, "an active athlete can't be deleted"
    throw(:abort)
  end
end
