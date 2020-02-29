require "rails_helper"

describe EnqueueTweetFetchJob do
  describe "#perform_later" do
    subject { EnqueueTweetFetchJob.perform_later }

    it "enqueue job" do
      expect { subject }.to have_enqueued_job
    end
  end
end
