require 'SecureRandom'
class ShortenedUrl < ActiveRecord::Base
  validates :short_url, :presence => true, :uniqueness => true
  validates :long_url, :presence => true
  validates :submitter_id, :presence => true

  belongs_to :submitter,
    class_name: "User",
    foreign_key: :submitter_id,
    primary_key: :id

  has_many :visits,
    class_name: "Visit",
    foreign_key: :shortened_url_id,
    primary_key: :id

  has_many :visitors,
    Proc.new { distinct },
    through: :visits,
    source: :visited_user

  def self.random_code
    begin
      random_code = SecureRandom::urlsafe_base64(16)
    end until !ShortenedUrl.exists?(:short_url => random_code)

    random_code
  end

  def self.create_for_user_and_long_url!(user, long_url)
    ShortenedUrl.create({:short_url => self.random_code, :long_url => long_url,
      :submitter_id => user.id})
  end

  def num_clicks
    self.visits.count
  end

  def num_uniques
    self.visitors.count
  end

  def num_recent_uniques
    self.num_uniques.where("created_at > ?", 10.minutes.ago)
  end

end
