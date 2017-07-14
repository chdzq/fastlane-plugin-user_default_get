describe Fastlane::Actions::UserDefaultGetAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The user_default_get plugin is working!")

      Fastlane::Actions::UserDefaultGetAction.run(nil)
    end
  end
end
