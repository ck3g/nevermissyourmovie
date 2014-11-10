class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.persisted?
      can [:read, :create, :watch, :stop_watching], Movie
      can [:edit, :update, :destroy], Movie do |movie|
        movie.user_id == user.id && movie.pending?
      end
      can :show, :watch_list
    else
      cannot :all, :all
      can :read, Movie
    end
  end
end
