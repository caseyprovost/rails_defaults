class FeatureFlipper
  def initialize(user, adapter = nil)
    @user = user
    @adapter = adapter || default_adapter
  end

  def accessible_by_user?(feature_id, user)
    adapter.active?(feature_id, user)
  end

  def enable_for_user(feature_id, user)
    adapter.activate_user(feature_id, user)
  end

  def enable_for_group(feature_id, group)
    adapter.activate_group(feature_id, group)
  end

  private

  def default_adapter
    @default_adapter ||= Rollout.new(Redis.current)
  end
end
