class RamodelGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)

  def create_model
    generate 'model', "#{file_name} #{options}"
  end

  def add_to_rails_admin_config
    # inject_into_file
  end

  def add_to_paper_trail
    # inject_into_file
  end

  def add_to_cancan
    # inject_into_file
  end

  # print notice to restart server to apply changes
end
