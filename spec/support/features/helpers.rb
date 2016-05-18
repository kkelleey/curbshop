module Features
  module AlertHelpers
    def have_alert(text)
      have_css('.alert', text: text)
    end
  end
end

RSpec.configure do |config|
  config.include Features::AlertHelpers, type: :feature
end
