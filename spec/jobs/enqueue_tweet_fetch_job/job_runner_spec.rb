require "rails_helper"

describe EnqueueTweetFetchJob::JobRunner do
  describe ".execute!" do
    subject { enqueue_tweet_fetch_job_job_runner.execute! }

    let!(:enqueue_tweet_fetch_job_job_runner) { EnqueueTweetFetchJob::JobRunner.new }
    let!(:frozen_now) { Time.zone.parse("2019/11/01 20:00:00") }
    let!(:task_tweet_fetcher_double) { double(:task_tweet_fetcher) }

    context "with featured event" do
      let!(:event) { create(:event, start_at: Time.zone.parse("2019/11/01 19:00:00"), end_at: Time.zone.parse("2019/11/01 23:00:00"))}

      it "enqueues TweetFetchJob" do
        travel_to frozen_now do
          subject

          expect(TweetFetchJob).to(
            have_been_enqueued.with(event)
          )
        end
      end
    end

    context "without featured event" do
      let!(:event) { create(:event, start_at: Time.zone.parse("2019/12/01 19:00:00"), end_at: Time.zone.parse("2019/12/01 23:00:00"))}

      it "enqueues TweetFetchJob" do
        travel_to frozen_now do
          subject

          expect(TweetFetchJob).not_to(
            have_been_enqueued.with(event)
          )
        end
      end
    end
  end
end
