class AthleteBlueprint < Blueprinter::Base
  identifier :id

  fields :name, :date_of_birth, :level, :status
end
