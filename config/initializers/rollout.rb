require "redis"

$redis = Redis.new
$rollout = Rollout.new($redis)

# These are some examples of how to define feature groups based on role/permission.
# Please tweak to your needs :)

$rollout.define_group(:early_access) do |user|
  user.has_role?(:early_access)
end

$rollout.define_group(:developers) do |user|
  user.has_role?(:developer)
end

$rollout.define_group(:tech_support) do |user|
  user.has_role?(:tech_support)
end

$rollout.define_group(:customer_support) do |user|
  user.has_role?(:customer_support)
end
