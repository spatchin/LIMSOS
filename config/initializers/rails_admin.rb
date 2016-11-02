require Rails.root.join('lib', 'rails_admin', 'order.rb')

RailsAdmin.config do |config|
  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  ## == Cancan ==
  config.authorize_with :cancan
  # or
  # config.authorize_with :pundit

  ## == PaperTrail ==
  config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  config.show_gravatar = false

  config.actions do
    # root actions
    dashboard
    # collection actions
    index
    new
    export
    bulk_delete
    # member actions
    show
    order
    edit
    # delete
    # show_in_app
    history_index
    history_show
  end

  config.model User do
    include_fields :username, :password, :password_confirmation, :email, :first_name, :last_name, :role
  end

  config.model BiomassType do
    owner_config
  end

  config.model Biomass do
    owner_config
  end

  config.model Feedstock do
    owner_config
  end

  config.model Harvest do
    owner_config
  end

  # Add new model configurations here
  config.model Material do
  end

  config.model MaterialType do
  end

  config.model InventoryPretreatedFeedstock do
  end

  config.model InventoryHydrolysate do
  end

  config.model InventoryUntreatedFeedstock do
  end

  config.model Inventory do
  end

  config.model InventoryBatch do
  end

  config.model Supplier do
  end
end

# DRYing up owner configurations for models
def owner_config
  list do
    # Don't show owner column in index
    exclude_fields :owner
  end
  edit do
    # Don't show owner field in new/edit
    exclude_fields :owner
    field :owner_id, :hidden do
      default_value do
        bindings[:view]._current_user.id
      end
    end
  end
  import do
    # Don't allow import to configure owner
    exclude_fields :owner
  end
end
