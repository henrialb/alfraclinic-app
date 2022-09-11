class ChallengeBlueprint < Blueprinter::Base
  identifier :id

  fields :name, :description, :result_unit, :category, :archived
end
