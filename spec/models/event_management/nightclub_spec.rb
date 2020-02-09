require 'rails_helper'

RSpec.describe EventManagement::Nightclub, type: :model do
  describe ".create!" do
    subject { EventManagement::Nightclub.create!(args) }

    let!(:args) do
      {
        name: "test club"
      }
    end

    context "with valid args" do

      specify do
        expect(Nightclub.count).to eq(0)
        subject
        expect(Nightclub.count).to eq(1)
        expect(Nightclub.first.name).to eq(args[:name])
      end
    end

    context "with blank name" do
      before do
        args[:name] = ""
      end

      specify do
        expect(Nightclub.count).to eq(0)
        subject
        expect { subject }.to raise_error(ActiveRecord::RecordInvalid)
        expect(Nightclub.count).to eq(0)
      end
    end
  end
end
