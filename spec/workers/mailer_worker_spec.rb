require 'rails_helper'

RSpec.describe MailerWorker, type: :request do
  user_id = 1
  movie_id = 2

  it 'sends emails' do
    expect {
        MailerWorker.perform_async(user_id, movie_id, :like)
    }.to change(MailerWorker.jobs, :size).by(1)
  end
end
