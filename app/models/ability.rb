class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user

    can :access, :rails_admin
    can :dashboard
    if user.admin?
      can :manage, :all
      can :import, :all
    else
      can :manage, Biomass, owner_id: user.id
      can :import, Biomass
      can :manage, BiomassType, owner_id: user.id
      can :import, BiomassType
      can :manage, Feedstock, owner_id: user.id
      can :import, Feedstock
      can :manage, Harvest, owner_id: user.id
      can :import, Harvest
    end
  end
end
