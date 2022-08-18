class Athlete < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  before_destroy :abort_destroy, unless: :archived?

  enum level: %i[amateur professional]

  scope :archived, -> { where(archived: true) }
  scope :not_archived, -> { all - archived }

  private

  def abort_destroy
    errors.add :base, "an active athlete can't be deleted"
    throw(:abort)
  end
end
