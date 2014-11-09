class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.persisted?
      can :read, Movie
      can :manage, Movie, user_id: user.id
    else
      cannot :all, :all
      can :read, Movie
    end
  end
end
