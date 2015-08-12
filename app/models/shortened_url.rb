require 'SecureRandom'
class ShortenedUrl < ActiveRecord::Base
  validates :short_url, :presence => true, :uniqueness => true
  validates :long_url, :presence => true
  validates :submitter_id, :presence => true

  belongs_to :user,
    class_name: "User",
    foreign_key: :submitter_id,
    primary_key: :id

  def self.random_code
    begin
      random_code = SecureRandom::urlsafe_base64
    end until !ShortenedUrl.exists?(:short_url => random_code)

    random_code
  end

  def self.create_for_user_and_long_url!(user, long_url)
    ShortenedUrl.new({:short_url => self.random_code, :long_url => long_url,
      :submitter_id => user.id})
  end

end
