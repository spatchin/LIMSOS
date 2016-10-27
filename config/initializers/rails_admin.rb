RailsAdmin.config do |config|
  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  ## == Cancan ==
  config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  config.show_gravatar = false

  config.actions do
    dashboard
    index
    new
    export
    bulk_delete
    show
    edit
    delete
    # show_in_app
    history_index
    history_show
  end

  config.model BiomassType do
    list do
      exclude_fields :owner
    end
    edit do
      exclude_fields :owner
    end
    import do
      exclude_fields :owner
    end
  end

  config.model Biomass do
    list do
      exclude_fields :owner
    end
    edit do
      exclude_fields :owner
    end
    import do
      # exclude_fields :owner
    end
  end

  config.model Feedstock do
    list do
      exclude_fields :owner
    end
    edit do
      exclude_fields :owner
    end
    import do
      exclude_fields :owner
    end
  end

  config.model Harvest do
    list do
      exclude_fields :owner
    end
    edit do
      exclude_fields :owner
    end
    import do
      exclude_fields :owner
    end
  end

  config.model User do
    export do
      field :id
      field :username
      field :email
    end
    import do
      field :id
      field :username
      field :email
    end
  end
end
