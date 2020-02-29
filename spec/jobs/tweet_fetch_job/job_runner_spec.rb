require "rails_helper"

describe TweetFetchJob::JobRunner do
  describe ".execute!" do
    subject { tweet_fetch_job_job_runner.execute! }

    let!(:tweet_fetch_job_job_runner) { TweetFetchJob::JobRunner.new(event) }
    let!(:event) { create(:event) }

    let!(:task_tweet_fetcher_double) { double(:task_tweet_fetcher) }

    it "will call ::Task::TweetFetcher#execute!" do
      expect(::Task::TweetFetcher).to(
        receive(:new).with(event: event)
      ).and_return(task_tweet_fetcher_double)

      expect(task_tweet_fetcher_double).to(
        receive(:execute!)
      )

      subject
    end
  end
end
