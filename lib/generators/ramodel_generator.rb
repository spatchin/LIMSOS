class RamodelGenerator < Rails::Generators::Base
	desc 'This generator creates a model and adds it to the rails admin, paper trail and cancan config files'
  
  def create_model
    generate 'model' # TODO: add arguments
  end

  def add_to_rails_admin_config
    inject_into_file
  end

  def add_to_paper_trail
    inject_into_file
  end

  def add_to_cancan
    inject_into_file
  end
end
