# URL Shortener #
`bundle install`
`rails runner bin/cli`


# Features #
- [x] TagTopic and Tagging: able to query for the most popular links in each category
- [x] Length of URL strings < 1024
- [x] no more than 5 urls are submitted in the last minute by one user, except premium users
- [ ] `ShortenedUrl::prune` deletes any shortened urls that have not been visited in the last (n) minutes. Automated in rake
- [ ] Custom URLs for premium users
      Series of random dictionary words
      
