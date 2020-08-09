# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Role::NAMES.each do |role_name|
  Role.find_or_create_by(name: role_name)
end

# This is your super user who has all the things
developer = User.find_by(username: "superdev", email: "superdev@ruby.dev")
developer ||= FactoryBot.create(:user, username: "superdev", email: "superdev@ruby.dev", name: "Tony Stark")

# Ensure our super user has all the roles and therefore all the features!
Role::NAMES.each do |role_name|
  next if developer.has_role?(role_name)
  developer.add_role(role_name)
end

# Enables the sidekiq UI
$rollout.activate_group(:bg_job_monitoring, :developer)

# Enables the blazer UI
$rollout.activate_group(:custom_reports, :tech_support)
