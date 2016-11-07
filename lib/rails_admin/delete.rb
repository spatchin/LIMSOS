require 'rails_admin/config/actions'
require 'rails_admin/config/actions/base'

module MyRailsAdmin
  module Config
    module Actions
      class Delete < RailsAdmin::Config::Actions::Delete
        RailsAdmin::Config::Actions::register(self)

        register_instance_option :controller do
          proc do
            if request.get? # DELETE

              respond_to do |format|
                format.html { render @action.template_name }
                format.js   { render @action.template_name, layout: false }
              end

            elsif request.delete? # DESTROY

              redirect_path = nil
              @auditing_adapter && @auditing_adapter.delete_object(@object, @abstract_model, _current_user)

              # [CUSTOM DELETE] mark as deactivated rather than actually hard delete it
              # @object.active = false

              if @object.destroy
              # if @object.save
                flash[:success] = t('admin.flash.successful', name: @model_config.label, action: t('admin.actions.delete.done'))
                redirect_path = index_path
              else
                flash[:error] = t('admin.flash.error', name: @model_config.label, action: t('admin.actions.delete.done'))
                redirect_path = back_or_index
              end

              redirect_to redirect_path

            end
          end
        end
      end
    end
  end
end
