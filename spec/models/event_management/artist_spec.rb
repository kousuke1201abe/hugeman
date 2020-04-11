require 'rails_helper'

RSpec.describe EventManagement::Artist, type: :model do
  describe ".create!" do
    subject { EventManagement::Artist.create!(args) }

    let!(:args) do
      {
        name: "test artist"
      }
    end

    context "with valid args" do

      specify do
        expect(Artist.count).to eq(0)
        subject
        expect(Artist.count).to eq(1)
        expect(Artist.first.name).to eq(args[:name])
      end
    end

    context "with blank name" do
      before do
        args[:name] = ""
      end

      specify do
        expect(Artist.count).to eq(0)
        subject
        expect(Artist.count).to eq(1)
      end
    end
  end
end
