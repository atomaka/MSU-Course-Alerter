class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :read, Alert,       :user_id => user.id
    can :create, Alert
    can :update, Alert,     :user_id => user.id
    can :destroy, Alert,    :user_id => user.id
  end
end
