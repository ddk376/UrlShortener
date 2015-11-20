class Tagging < ActiveRecord::Base
  validates :tag_topic_id, :shortened_url_id, presence: true

  belongs_to :tag_topic
  belongs_to :shortened_url
end
