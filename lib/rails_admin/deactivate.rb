require 'rails_admin/config/actions'
require 'rails_admin/config/actions/base'

module RailsAdmin
  module Config
    module Actions
      class Deactivate < RailsAdmin::Config::Actions::Base
        RailsAdmin::Config::Actions::register(self)

        register_instance_option :member do
          true
        end

        register_instance_option :controller do
          proc do
            if params[:bulk_ids]
              params[:bulk_ids].each do |id|
                @abstract_model.model.update(id, active: false)
              end
              flash[:success] = "#{@model_config.label} is deactivated"
            else
              @object.active = false
              if @object.save
                flash[:success] = "#{@model_config.label} is deactivated"
              else
                flash[:error] = "#{@model_config.label} could not be deactivated"
              end
            end
            redirect_to index_path
          end
        end

        register_instance_option :link_icon do
          'fa fa-remove'
        end

        register_instance_option :bulkable? do
          true
        end

      end
    end
  end
end
