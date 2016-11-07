class Ability
  include CanCan::Ability

  FS_MANAGEMENT = [Biomass, BiomassType, Feedstock, Harvest]
  INVENTORY_MANAGEMENT = [Inventory, InventoryBatch, InventoryHydrolysate, InventoryUntreatedFeedstock, InventoryPretreatedFeedstock, Material]

  def initialize(user)
    user ||= User.new # guest user

    can :access, :rails_admin
    can :dashboard
    if user.active_ws == 1
      can :manage, FS_MANAGEMENT
    elsif user.active_ws == 2
      can :manage, INVENTORY_MANAGEMENT
    elsif user.active_ws == 3
      can :manage, User
      can :history, :all
    end
  end
end
