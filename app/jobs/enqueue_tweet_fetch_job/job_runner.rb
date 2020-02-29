class EnqueueTweetFetchJob::JobRunner
  def execute!
    with_log do
      Event.featured.each do |event|
        TweetFetchJob.perform_later(event)
      end
    end
  end

  private

  def logger
    Rails.logger
  end

  def with_log
    begin
      logger.info("Enqueue Tweet Fetch Job")
      yield
      logger.info("Enqueued Tweet Fetch Job")
    rescue => e
      logger.fatal(e.full_message)
      logger.fatal(e.backtrace.join("\n"))
      logger.info("Faild to enqueue Tweet Fetch Job")
      raise
    end
  end
end
