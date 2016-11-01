class RamodelGenerator < Rails::Generators::NamedBase
  argument :attributes, type: :array, default: [], banner: "field[:type][:index] field[:type][:index]"

  source_root File.expand_path('../templates', __FILE__)

  def create_model
    generate 'model', "#{file_name} #{attributes_to_arguments}"
  end

  def add_to_rails_admin_config
    insert_into_file "#{Rails.root}/config/initializers/rails_admin.rb", after: "# Add new model configurations here\n" do
      ["\tconfig.model #{name.camelize} do",
      "\t\towner_config",
      "\tend"].join("\n")
    end
  end

  def add_to_model
    insert_into_file "#{Rails.root}/app/models/#{name.underscore}.rb", after: "class #{name.camelize} < ApplicationRecord\n" do
      "\thas_paper_trail"
    end
  end

  def add_to_cancan
    insert_into_file "#{Rails.root}/app/models/ability.rb", after: "# Add new model permissions here\n" do
      "\t\t\tcan :manage, #{name.camelize}, owner_id: user.id"
    end
  end

  # print notice to restart server to apply changes

  private

  # There is probably a better way to do this but this method takes that attributes
  # for ramodel generator and applies them to the standard model generator
  def attributes_to_arguments
    arguments = []
    attributes.each do |field|
      arguments << "#{field.name}:#{field.type}"
    end
    arguments.join(' ')
  end
end
