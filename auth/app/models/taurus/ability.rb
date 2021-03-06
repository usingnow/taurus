# Implementation class for Cancan gem.  Instead of overriding this class, consider adding new permissions
# using the special +register_ability+ method which allows extensions to add their own abilities.
#
# See http://github.com/ryanb/cancan for more details on cancan.
module Taurus
  class Ability
    include CanCan::Ability

    def initialize(administrator)
      
      if administrator.admin_type == 0
        can :manage, :all
      else
        administrator ||= Administrator.new 
        administrator.groups.each do |group|
          group.fun_permissions.each do |fun_per|
            fun_per.permissions.each do |per|
              can eval(per["action_name"]), eval(per["class_name"])
            end
          end
        end
      end  
      
      # Define abilities for the passed in user here. For example:
      #
      #
      # The first argument to `can` is the action you are giving the user permission to do.
      # If you pass :manage it will apply to every action. Other common actions here are
      # :read, :create, :update and :destroy.
      #
      # The second argument is the resource the user can perform the action on. If you pass
      # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
      #
      # The third argument is an optional hash of conditions to further filter the objects.
      # For example, here the user can only update published articles.
      #
      #   can :update, Article, :published => true
      #
      # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
    end

  end
end
