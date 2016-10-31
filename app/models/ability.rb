class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user

    can :access, :rails_admin
    can :dashboard
    if user.admin?
      can :manage, :all
    else
      can :manage, Biomass, owner_id: user.id
      can :manage, BiomassType, owner_id: user.id
      can :manage, Feedstock, owner_id: user.id
      can :manage, Harvest, owner_id: user.id
      cannot :manage, User
    end
  end
end
