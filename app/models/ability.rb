class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.persisted?
      can [:read, :create, :watch, :stop_watching], Movie
      can [:edit, :update, :destroy], Movie, user_id: user.id
      can :show, :watch_list
    else
      cannot :all, :all
      can :read, Movie
    end
  end
end
