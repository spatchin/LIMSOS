Dir[Rails.root.join('lib', 'rails_admin', '*.rb')].each { |file| require file }

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
  config.model "PaperTrail::Version" do
    visible false
  end

  config.model "PaperTrail::VersionAssociation" do
    visible false
  end

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  config.show_gravatar = false

  config.actions do
    # root actions
    dashboard
    # collection actions
    index
    new do
      except User
    end
    export
    bulk_delete
    adv_search
    charts
    # member actions
    show
    edit
    deactivate do
      except [User, Workspace]
    end
    delete
    history_index
    history_show
  end

  config.model Workspace do
    list do
      include_all_fields
      field :models do
        pretty_value do
          value.join(', ')
        end
      end
    end
    edit do
      exclude_fields :models
    end
  end

  config.model User do
    include_fields :username, :email, :first_name, :last_name, :role, :sign_in_count
    field :role, :enum do
      enum do
        User::ROLES
      end

      default_value User::ROLES.first
    end
    create do
      exclude_fields :sign_in_count
    end
  end

  config.model BiomassType do
    owner_config
  end

  config.model Biomass do
    owner_config
  end

  config.model Feedstock do
    list do
      include_all_fields
      field :harvest do
        searchable [:plot_location, :plot_information, :planting_date, :harvest_date]
      end
    end
    owner_config
  end

  config.model Harvest do
    owner_config
  end

  # Add new model configurations here
  config.model Material do
    owner_config
  end

  config.model MaterialType do
  end

  config.model InventoryPretreatedFeedstock do
    owner_config
    label 'Pretreated Feedstock'
  end

  config.model InventoryHydrolysate do
    owner_config
    label 'Hydrolysate'
  end

  config.model InventoryUntreatedFeedstock do
    owner_config
    label 'Untreated Feedstock'
  end

  config.model Inventory do
    owner_config
  end

  config.model InventoryBatch do
    owner_config
  end

  config.model Supplier do
  end
end

# DRYing up owner configurations for models
def owner_config
  edit do
    # Don't show owner field in new/edit
    exclude_fields :owner
    field :owner_id, :hidden do
      default_value do
        bindings[:view]._current_user.id
      end
    end
  end
  create do
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
