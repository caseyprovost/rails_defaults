class Role < ApplicationRecord
  NAMES = [:early_access, :developer, :tech_support, :customer_support]

  has_and_belongs_to_many :users, join_table: :users_roles

  belongs_to :resource,
    polymorphic: true,
    optional: true

  validates :resource_type,
    inclusion: {in: Rolify.resource_types},
    allow_nil: true

  scopify
end
