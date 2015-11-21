class TagTopic < ActiveRecord::Base
  validates :topic, presence: true

  has_many :tagged_urls,
    class_name: "Tagging",
    foreign_key: :tag_topic_id

  has_many :urls_with_tagtopic,
    through: :tagged_urls,
    source: :shortened_url

  def most_popular
    most_popular_url = []
    self.urls_with_tagtopic.each do |url|
      if most_popular_url.empty? || url.num_clicks >= most_popular_url.first.num_clicks
        if most_popular_url.first.nil? || most_popular_url.first.num_clicks == url.num_clicks
          most_popular_url << url
        else
          most_popular_url = []
          most_popular_url << url
        end
      end
    end

    most_popular_url
  end
end
