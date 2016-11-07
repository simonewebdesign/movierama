class MailerWorker
  include Sidekiq::Worker

  def perform(user_id, movie_id, vote)
    VoteMailer.delay.voted(user_id, movie_id, vote)
  end
end
