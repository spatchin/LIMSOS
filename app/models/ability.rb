class Ability
  include CanCan::Ability

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
      if workspace
        can :manage, workspace.models, active: true
        cannot :destroy, workspace.models
      else
        cannot :manage, :all
      end
    end
  end
end
