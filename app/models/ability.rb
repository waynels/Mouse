#encoding: utf-8
class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new # guest user (not logged in)
    if user.has_role?(:admin)
      can :manage, :all
    end
    if user.has_role?(:PI)
      can :manage, :all
      cannot :update, Mouse 
      cannot :handle_mouse, Mouse 
      cannot :set_cage_type, Basket 
    end
    if user.has_role?(:Manager)
      can :manage, User, :id => user.id 
      can :read, Mouse
      can :manage, Mouse, :onwer_id => user.id
      can :manage, Strain
      can :manage, Gene
      can :manage, Basket 
      can :manage, Breed 
    end
    if user.has_role?(:Faculty)
      can :manage, User, :id => user.id 
      can :read, Mouse
      can :manage, Mouse, :onwer_id => user.id
      can :edit, Basket, :onwer_id => user.id
      can :manage, Breed 
    end
    #
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
