require "rails_helper"

describe TweetFetchJob do
  describe "#perform_later" do
    subject { TweetFetchJob.perform_later(event) }

    let!(:event) { create(:event) }

    it "enqueue job" do
      expect { subject }.to have_enqueued_job.with(event)
    end
  end
end
