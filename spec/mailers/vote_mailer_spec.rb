require 'rails_helper'
require 'spec_helper'

RSpec.describe VoteMailer, type: :mailer do

  context 'when sending a like/hate email' do
    before do
      @voter = User.create(name: 'Latin Lover', email: 'lover@example.com')
      @original_poster = User.create(email: 'op@example.com')
      @movie = Movie.create(title: 'Sausage Party', user: @original_poster)
      @mail = VoteMailer.voted(@voter.id, @movie.id, :like)
    end

    it 'is sent to the original poster' do
      expect(@mail.to).to eq([@original_poster.email])
    end

    it 'has the right "from"' do
      expect(@mail.from.first).to eq('notifications@movierama.com')
    end

    it 'has the right subject' do
      expect(@mail.subject).to eq("#{@voter.name} liked your movie!")
    end

    it 'contains information in the body' do
      expect(@mail.body.encoded).to match /#{@voter.name} liked your movie, #{@movie.title}/
    end
  end
end
