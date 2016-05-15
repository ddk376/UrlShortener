namespace :prune do
  desc "Prune any shortened urls that have not been visited in the last (n) minutes"
  task prune_old_urls: :enviornment do
    puts "Pruning old shortened urls"
    ShortenedUrl.prune(30)
  end
end
