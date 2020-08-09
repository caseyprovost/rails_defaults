# This module helps enforce feature flags in specified controllers. Simply include this concern
# in a controller and define which feature flag the controller requires like so:
#
# class AccountTransfers < ApplicationController
# 	include FeatureFlippable
#   feature_flag(:account_transfers)
# end
#
# * enforces the feature flag is accessible by the current user
# * enforces that feature_flag is set on the controller
module FeatureFlippable
  extend ActiveSupport::Concern

  class_methods do
    attr_reader :feature_flaggable_name

    def feature_flag(feature_name)
      @feature_flaggable_name = feature_name
    end
  end

  included do
    prepend_before_action :enforce_feature_flag!

    private

    def enforce_feature_flag!
      if self.class.feature_flaggable_name.nil?
        raise ArgumentError.new("No feature flag specified! \n\nPlease call `feature_flag(:some_flag)` in #{self.class.name}.")
      end

      unless FeatureFlipper.accessible_by_user?(self.class.feature_flaggable_name, current_user)
        raise AbstractController::ActionNotFound
      end
    end
  end

  def feature_flipper
    @feature_flipper ||= FeatureFlipper.new(current_user, $rollout)
  end
end
