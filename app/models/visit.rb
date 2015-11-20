class Visit < ActiveRecord::Base
  validates :user_id, :presence => true
  validates :shortened_url_id, :presence => true
  MAX_SUBMITS = 5
  belongs_to :short_url,
    class_name: "ShortenedUrl",
    foreign_key: :shortened_url_id,
    primary_key: :id

  belongs_to :visited_user,
    class_name: "User",
    foreign_key: :user_id,
    primary_key: :id

  def self.record_visit!(user, shortened_url)
    if self.not_too_much_submitted?(user)
      Visit.create!({:user_id => user.id, :shortened_url_id => shortened_url.id})
    end
  end

  def self.not_too_much_submitted?(user)
    return false if user.premium
    count = user.submitted_urls.where("created_at < ?", 1.minutes.ago).length <= 4 ||
    if count.nil? || count < MAX_SUBMITS
      return false
    end

    true
  end
end
