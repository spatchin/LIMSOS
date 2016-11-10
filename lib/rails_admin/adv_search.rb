require 'rails_admin/config/actions'
require 'rails_admin/config/actions/base'

module RailsAdmin
  module Config
    module Actions
      class AdvSearch < RailsAdmin::Config::Actions::Base
        RailsAdmin::Config::Actions::register(self)

        register_instance_option :collection do
          true
        end

        register_instance_option :controller do
          proc do
            @q = @abstract_model.model.ransack(params[:q])
            @objects = @q.result(distinct: true)
          end
        end

        register_instance_option :link_icon do
          'fa fa-search'
        end
      end
    end
  end
end
