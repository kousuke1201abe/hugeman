require 'rails_helper'

RSpec.describe EventManagement::User, type: :model do
  describe ".create!" do
    subject { EventManagement::User.create!(args) }

    let!(:args) do
      {
        name: "test name",
        email: "test@gmail.com",
        password: "password",
      }
    end

    context "with valid args" do

      specify do
        expect(User.count).to eq(0)
        expect(User::PasswordAuthentication.count).to eq(0)
        subject
        expect(User.count).to eq(1)
        expect(User::PasswordAuthentication.count).to eq(1)
        expect(User.first.name).to eq(args[:name])
        expect(User.first.email).to eq(args[:email])
        expect(User.first.password_authentication.authenticate(args[:password])).to eq(User::PasswordAuthentication.first)
      end
    end

    context "with invalid email" do
      before do
        args[:email] = "invalid email"
      end

      specify do
        expect(User.count).to eq(0)
        expect(User::PasswordAuthentication.count).to eq(0)
        expect { subject }.to raise_error(ActiveRecord::RecordInvalid)
        expect(User.count).to eq(0)
        expect(User::PasswordAuthentication.count).to eq(0)
      end
    end

    context "with invalid password" do
      before do
        args[:password] = "pass"
      end

      specify do
        expect(User.count).to eq(0)
        expect(User::PasswordAuthentication.count).to eq(0)
        expect { subject }.to raise_error(ActiveRecord::RecordInvalid)
        expect(User.count).to eq(0)
        expect(User::PasswordAuthentication.count).to eq(0)
      end
    end

    context "with blank name" do
      before do
        args[:name] = ""
      end

      specify do
        expect(User.count).to eq(0)
        expect(User::PasswordAuthentication.count).to eq(0)
        expect { subject }.to raise_error(ActiveRecord::RecordInvalid)
        expect(User.count).to eq(0)
        expect(User::PasswordAuthentication.count).to eq(0)
      end
    end

    context "with blank email" do
      before do
        args[:email] = ""
      end

      specify do
        expect(User.count).to eq(0)
        expect(User::PasswordAuthentication.count).to eq(0)
        expect { subject }.to raise_error(ActiveRecord::RecordInvalid)
        expect(User.count).to eq(0)
        expect(User::PasswordAuthentication.count).to eq(0)
      end
    end

    context "with blank password" do
      before do
        args[:password] = ""
      end

      specify do
        expect(User.count).to eq(0)
        expect(User::PasswordAuthentication.count).to eq(0)
        expect { subject }.to raise_error(ActiveRecord::RecordInvalid)
        expect(User.count).to eq(0)
        expect(User::PasswordAuthentication.count).to eq(0)
      end
    end
  end
end
