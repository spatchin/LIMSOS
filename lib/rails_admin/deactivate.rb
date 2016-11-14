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

        register_instance_option :http_methods do
          [:get, :put]
        end

        register_instance_option :controller do
          proc do
            if request.get?
              respond_to do |format|
                format.html { render @action.template_name }
                format.js   { render @action.template_name, layout: false }
              end
            elsif request.put?
              if params[:bulk_ids]
                @abstract_model.model.where(id: params[:bulk_ids]).update_all(active: false)
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
