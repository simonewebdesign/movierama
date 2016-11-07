class VoteMailer < ActionMailer::Base
  default from: 'notifications@movierama.com'

  def voted(user_id, movie_id, vote)
    @user = User[user_id]
    @movie = Movie[movie_id]
    @original_poster = User[@movie.user_id]
    @vote = vote

    mail(to: @original_poster.email, subject: "#{@user.name} #{vote}d your movie!")
  end
end
