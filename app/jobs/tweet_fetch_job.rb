class TweetFetchJob < ApplicationJob
  def perform(event)
    job_runner = JobRunner.new(event)
    job_runner.execute!
  end
end
