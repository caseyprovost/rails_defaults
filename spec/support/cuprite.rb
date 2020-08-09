require "capybara/cuprite"
Capybara.javascript_driver = :cuprite
Capybara.register_driver(:cuprite) do |app|
  browser_options = {}
  browser_options["no-sandbox"] = nil if ENV["CI"]
  Capybara::Cuprite::Driver.new(
    app,
    browser_options: browser_options,
    inspector: ENV["INSPECTOR"],
    window_size: [1200, 800]
  )
end
