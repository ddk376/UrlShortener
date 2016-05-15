class Vote < ActiveRecord::Base
  validates :user_id, :shortened_url_id, presence: true
  validates :user_id, uniqueness: { scope: :shortened_url_id}
  validates :upvote, inclusion: [0,1]
  validates :downvote, inclusion: [0,1]
  validates :cannot_vote_on_own_submitted_url

  def self.upvote(user, url)
    if !Vote.exists?(user_id: user.id, shortened_url_id: url.id)
      Vote.create!(user_id: user.id, shortened_url_id: url.id)
    end
  end

  def self.downvote(user, url)
    if Vote.exists?(user_id: user.id, shortened_url_id: url.id)
      vote = Vote.where("user_id = (?) AND shortened_url_id = (?)", user.id, url.id)
      vote.destroy
    end
  end

  private
  def cannot_vote_on_own_submitted_url
    url = ShortenedUrl.find(self.shortened_url_id)
    if self.user_id == url.submitter_id
      errors[:user_id] << "cannot vote for own submitted url"
    end
  end
end
