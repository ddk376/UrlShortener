class Visit < ActiveRecord::Base
  validates :submitter_id, :presence => true
  validates :shortened_url_id, :presence => true

  def self.record_visit!(user, shortened_url)
    Visit.new({:submitter_id => user.id, :shortened_url_id => shortened_url.id})
  end

  belongs_to :short_url,
    class_name: "ShortenedUrl",
    foreign_key: :shortened_url_id,
    primary_key: :id

  belongs_to :submitter,
    class_name: "User",
    foreign_key: :submitter_id,
    primary_key: :id

end
