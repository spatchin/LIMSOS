class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user

    can :access, :rails_admin
    can :dashboard
    if user.admin?
      can :manage, :all
    else
      can :read, :all
      cannot :manage, User
      can :manage, Biomass, owner_id: user.id
      can :manage, BiomassType, owner_id: user.id
      can :manage, Feedstock, owner_id: user.id
      can :manage, Harvest, owner_id: user.id
      # Add new model permissions here
      can :manage, Inventory, owner_id: user.id
      can :manage, InventoryBatch, owner_id: user.id
      can :manage, InventoryUntreatedFeedstock, owner_id: user.id
      can :manage, InventoryPretreatedFeedstock, owner_id: user.id
      can :manage, InventoryHydrolysate, owner_id: user.id
      can :manage, Material, owner_id: user.id
    end
  end
end
