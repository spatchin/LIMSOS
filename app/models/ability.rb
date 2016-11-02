class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user

    can :access, :rails_admin
    can :dashboard
    if user.admin?
      can :manage, :all
    else
      cannot :manage, User
      can :manage, Biomass, owner_id: user.id
      can :manage, BiomassType, owner_id: user.id
      can :manage, Feedstock, owner_id: user.id
      can :manage, Harvest, owner_id: user.id
      # Add new model permissions here
      can :manage, Material
      can :manage, MaterialType
      can :manage, InventoryPretreatedFeedstock
      can :manage, InventoryHydrolysate
      can :manage, InventoryUntreatedFeedstock
      can :manage, Inventory
      can :manage, InventoryBatch
      can :manage, Supplier
    end
  end
end
