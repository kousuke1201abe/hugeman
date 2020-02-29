class EnqueueTweetFetchJob < ApplicationJob
  def perform
    job_runner = JobRunner.new
    job_runner.execute!
  end
end
