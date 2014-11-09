class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.persisted?
      can [:read, :manage], Movie
    else
      cannot :all, :all
      can :read, Movie
    end
  end
end
