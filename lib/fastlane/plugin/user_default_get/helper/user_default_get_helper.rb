module Fastlane
  module Helper
    class UserDefaultGetHelper
      # class methods that you define here become available in your action
      # as `Helper::UserDefaultGetHelper.your_method`
      #
      def self.show_message
        UI.message("Hello from the user_default_get plugin helper!")
      end
    end
  end
end
