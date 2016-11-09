class Ability
  include CanCan::Ability

  FS_MANAGEMENT = [Biomass, BiomassType, Feedstock, Harvest]
  INVENTORY_MANAGEMENT = [Inventory, InventoryBatch, InventoryHydrolysate, InventoryUntreatedFeedstock, InventoryPretreatedFeedstock, Material, MaterialType, Supplier]

  def initialize(user)
    user ||= User.new # guest user

    can :access, :rails_admin
    can :dashboard
    if user.admin?
      case user.active_ws
      when 1
        can :manage, FS_MANAGEMENT
        cannot :deactivate, FS_MANAGEMENT, active: false
      when 2
        can :manage, INVENTORY_MANAGEMENT
      when 3
        can :manage, User
        can :history, :all
      end
    else
      case user.active_ws
      when 1
        can :manage, FS_MANAGEMENT, active: true
        cannot :destroy, FS_MANAGEMENT
      when 2
        can :manage, INVENTORY_MANAGEMENT
      when 3
        can :manage, User
        cannot [:destroy, :edit], User
        can :history, :all
      end
    end

  end
end
