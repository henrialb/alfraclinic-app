class AthleteBlueprint < Blueprinter::Base
  identifier :id

  fields :name, :date_of_birth, :level, :archived
end
