module RailsAdmin
  module Config
    module Actions
      class Order < RailsAdmin::Config::Actions::Base
        RailsAdmin::Config::Actions.register(self)

        register_instance_option :visible? do
          authorized? && bindings[:object].class == Feedstock
        end

        register_instance_option :member do
          true
        end

        register_instance_option :link_icon do
          'icon-check'
        end
      end
    end
  end
end
