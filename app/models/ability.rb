# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize user
    can :manage, :all if user.admin?
    can :manage, :all if user.supervisor?
    return unless user.trainee?
    can :read, [Task, Course, Subject]
    can :update, User, id: user.id
  end
end
