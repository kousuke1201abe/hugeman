require 'rails_helper'

RSpec.describe EventManagement::Event::Publishing, type: :model do
  describe ".publish!" do
    subject { EventManagement::Event::Publishing.publish!(args) }

    let!(:event) { create(:event, user: user) }
    let!(:args) do
      {
        event_id: event.id
      }
    end

    context "with valid args" do
      expect(Event::Publishing.count).to eq(0)
      subject
      expect(Event::Publishing.count).to eq(1)
      expect(Event::Publishing.first.event_id).to eq(args[:event_id])
    end

    context "with invalid args" do
      before do
        args[:event_id] = ""
      end

      specify do
        expect(Event::Publishing.count).to eq(0)
        expect { subject }.to raise_error(ActiveRecord::RecordInvalid)
        expect(Event::Publishing.count).to eq(0)
      end
    end
  end
end
