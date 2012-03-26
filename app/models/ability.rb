class Ability
  include CanCan::Ability

  def initialize(administrator)
    # Define abilities for the passed in user here. For example:
    #
    administrator ||= Administrator.new # guest user (not logged in)
    administrator.groups.each do |group|
      group.permissions.each do |permission|
        can eval(permission.operating.action), eval(permission.operating.subject_class)
      end
    end

    administrator.groups.each do |group|
      group.procedure_permissions.each do |permission|
        can eval(permission.condition.act), eval(permission.condition.subject_class),
            :instance => {:procedure_id => permission.procedure_id, :station_id => permission.station_id }
      end
    end


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
