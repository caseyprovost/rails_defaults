class FlashMessageComponent < ViewComponent::Base
  attr_reader :type
  attr_reader :text

  def initialize(type:, text:)
    @type = type
    @text = text
  end

  def styles
    if ["alert", "error"].include?(type)
      details[:error]
    else
      details[type.to_sym]
    end
  end

  def icon
    if ["alert", "error"].include?(type)
      details.dig(:error, :icon)
    else
      details.dig(type.to_sym, :icon)
    end
  end

  private

  # Set up your colors based on the type of flash message here
  def details
    return @details if @defaults

    @details = {}
    @details[:info] = {container: "bg-indigo-100 text-indigo-600 border-indigo-200", icon: "fa-info-circle text-indigo-500"}
    @details[:warning] = {container: "bg-yellow-100 text-yellow-600 border-yellow-200", icon: "fa-exclamation-triangle text-yellow-500"}
    @details[:success] = {container: "bg-green-100 text-green-600 border-green-200", icon: "fa-check-circle text-green-500"}
    @details[:error] = {container: "bg-red-100 text-red-600 border-red-200", icon: "fa-exclamation-circle text-red-500"}
    @details
  end
end
