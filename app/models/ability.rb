class Ability
  include CanCan::Ability

  FS_MANAGEMENT = [Biomass, BiomassType, Feedstock, Harvest]
  INVENTORY_MANAGEMENT = [Inventory, InventoryBatch, InventoryHydrolysate, InventoryUntreatedFeedstock, InventoryPretreatedFeedstock, Material, MaterialType, Supplier]

  def initialize(user)
    user ||= User.new # guest user

    can :access, :rails_admin
    can :dashboard
    if user.admin?
      workspace = Workspace.find_by_id(user.active_ws)
      if workspace && workspace.name == 'Administration'
        can :manage, workspace.models
        can :history, :all
        cannot [:import, :show], workspace.models
      elsif workspace
        can :manage, workspace.models
        cannot :deactivate, workspace.models, active: false
      else
        can :manage, :all
      end
    else
      workspace = Workspace.find_by_id(user.active_ws)
      if workspace && workspace.name == 'Administration'
        can :manage, workspace.models
        can :history, :all
        cannot [:create, :destroy, :import, :edit], Workspace
        cannot [:create, :destroy, :edit], User
      elsif workspace
        can :manage, workspace.models, active: true
        cannot :destroy, workspace.models
      else
        cannot :manage, :all
      end
    end
  end
end
