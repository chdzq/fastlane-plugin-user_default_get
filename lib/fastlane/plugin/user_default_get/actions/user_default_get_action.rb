module Fastlane
  module Actions
    class UserDefaultGetAction < Action
      def self.run(params)
        UI.message("The user_default_get plugin is working!")
        path = params[:path]
        map = Hash.new
        if File.exist? path
          json_string = File.read(path)
          json = JSON.parse(json_string)
          map = json if json.is_a? Hash
        end
        key = params[:key]
        return map[key]
      end

      def self.description
        "get value like ios userDefault"
      end

      def self.authors
        ["zhangqi"]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
        # Optional:
        "get value from the path configure"
      end

      def self.available_options
        [
          # FastlaneCore::ConfigItem.new(key: :your_option,
          #                         env_name: "USER_DEFAULT_GET_YOUR_OPTION",
          #                      description: "A description of your option",
          #                         optional: false,
          #                             type: String)
          FastlaneCore::ConfigItem.new(key: :path,
                                       env_name: "user_default_path_get", # The name of the environment variable
                                       description: "Path for user default", # a short description of this parameter
                                       default_value: "build/.configure.fastlane",
                                       optional: true),
          FastlaneCore::ConfigItem.new(key: :key,
                                       env_name: "user_default_key_get",
                                       description: "key for user default",
                                       is_string: true,
                                       verify_block: proc do |value|
                                         UI.user_error!("No key for UserDefaultGetAction , pass using `key: 'key'`") unless (value and not value.empty?)
                                               # UI.user_error!("Couldn't find file at path '#{value}'") unless File.exist?(value)
                                       end)


        ]
      end

      def self.is_supported?(platform)
        # Adjust this if your plugin only works for a particular platform (iOS vs. Android, for example)
        # See: https://github.com/fastlane/fastlane/blob/master/fastlane/docs/Platforms.md
        #
        return [:ios, :mac, :android].include?(platform)
      end
    end
  end
end
