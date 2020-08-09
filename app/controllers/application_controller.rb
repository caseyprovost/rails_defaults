class ApplicationController < ActionController::Base
  include Pagy::Backend
  include Pundit
end
