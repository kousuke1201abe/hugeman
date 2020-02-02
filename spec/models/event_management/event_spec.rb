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

  describe "#update" do
    subject { event.update!(args) }

    let!(:event) { create(:event) }
    let!(:args) do
      {
        name: "test name",
        tag: "test tag",
        start_at: Time.zone.parse("2018/12/01 00:00:00"),
        end_at: Time.zone.parse("2018/12/02 00:00:00"),
      }
     end

     context "with valid args" do
      specify do
        expect(event).to be_valid
        subject
        expect(event.name).to eq(args[:name])
        expect(event.tag).to eq(args[:tag])
        expect(event.start_at).to eq(args[:start_at])
        expect(event.end_at).to eq(args[:end_at])
      end
     end
end
end

