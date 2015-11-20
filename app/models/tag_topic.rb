class TagTopic < ActiveRecord::Base
  validates :topic, presence: true

  has_many :tagged_urls,
    class_name: "Tagging",
    foreign_key: :tag_topic_id
    
end
