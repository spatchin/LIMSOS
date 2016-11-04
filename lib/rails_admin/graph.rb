module RailsAdmin
  module Config
    module Actions
      class Graph < RailsAdmin::Config::Actions::Base
        RailsAdmin::Config::Actions.register(self)

        register_instance_option :collection do
          true
        end

        register_instance_option :bulkable? do
          true
        end

        register_instance_option :link_icon do
          'icon-signal'
        end

        register_instance_option :pjax? do
          false
        end
      end
    end
  end
end
