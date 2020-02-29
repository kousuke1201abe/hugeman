class TweetFetchJob::JobRunner
  attr_reader :event

  def initialize(event)
    @event = event
  end

  def execute!
    with_log do
      task_tweet_fetcher.execute!
    end
  end

  private

  def task_tweet_fetcher
    @task_tweet_fetcher ||=
      ::Task::TweetFetcher.new(event: event)
  end

  def logger
    Rails.logger
  end

  def with_log
    begin
      logger.info("Fetch tweets for Event[#{event.id}]")
      yield
      logger.info("Fetched tweets for Event[#{event.id}]")
    rescue => e
      logger.fatal(e.full_message)
      logger.fatal(e.backtrace.join("\n"))
      logger.info("Failed to Fetche tweets for Event[#{event.id}]")
      raise
    end
  end
end
