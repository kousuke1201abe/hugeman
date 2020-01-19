require 'rails_helper'

RSpec.describe EventManagement::Event, type: :model do
  describe ".filter_user_by" do
    subject { EventManagement::Event.filter_user_by(args) }
    let!(:args) { user.id }
    let!(:user) { create(:user) }

    it "returns events with login user" do
      user = User.find(args)
      expect(User.count).to eq(1)
      subject
      expect(User.count).to eq(1)
    end
  end
end
