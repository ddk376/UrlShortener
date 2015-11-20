class AddLengthtoShortenedUrl < ActiveRecord::Migration
  def change
    change_column :shortened_urls, :long_url, :string, length: 1024
  end
end
