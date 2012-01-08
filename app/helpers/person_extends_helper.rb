module PersonExtendsHelper
  def setup_event(event)
    event.build_user unless event.user
    event
end
end
