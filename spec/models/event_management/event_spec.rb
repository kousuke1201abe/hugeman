require 'rails_helper'

RSpec.describe EventManagement::Event, type: :model do
  describe ".filter_user_by" do
      subject { EventManagement::Event.filter_user_by(args) }
    
      let!(:user) { create(:user) }
      let!(:event) { create(:event, user: user) }
      let!(:args) { user.id }

       it "returns events with login user" do
         expect(subject).to eq(user.events)
       end
      end

  describe "#update!" do
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

    context "with blank name" do
      before do
        args[:name] = ""
      end

      specify do
          expect(event).to be_valid
          expect{ subject }.to raise_error(ActiveRecord::RecordInvalid)
       end
    end

    context "with blank tag" do
      before do
        args[:tag] = ""
      end

      specify do
        expect(event).to be_valid
        expect{ subject }.to raise_error(ActiveRecord::RecordInvalid)
      end
    end

    context "with blank start_at" do
      before do
        args[:start_at] = ""
      end

    specify do
      expect(event).to be_valid
      expect{ subject }.to raise_error(ActiveRecord::RecordInvalid)
      end
    end

    context "with blank end_at" do
      before do
        args[:end_at] = ""
      end

    specify do
      expect(event).to be_valid
      expect{ subject }.to raise_error(ActiveRecord::RecordInvalid)
    end
    end
  end
end

