# URL Shortener
A simple CLI tool that takes an arbitrarily-long URL and will shorten it for the user. Subsequent users
can then give the short URL back to out tool and be redirected to the original URL.
This application also track clickthroughs, since these can be really helpful for business analytics.

URL-shortening apps are useful for embedding long URLs in space-constrained messages like tweets
This is inspired by [Google's shortener](https://goo.gl/)

Uses `launchy` gem to pop open the original URL in a browser

## How to Use
`bundle install`
`rails runner bin/cli`

## Features
- Uses `SecureRandom::urlsafe_base64` to generate a 16 letter random
- adds "scope block" in `ShortenedUrl has_many :visitors` to remove duplicates
- script to handle user input is stored in `bin/cli`
## Bonus Implementations
- [x] TagTopic and Tagging: able to query for the most popular links in each category
- [x] Length of URL strings < 1024
- [x] no more than 5 urls are submitted in the last minute by one user, except premium users
- [x] `ShortenedUrl::prune` deletes any shortened urls that have not been visited in the last (n) minutes. Does not prune urls submitted by premium users.
- [ ] Automate `ShortenedUrl::prune` in rake
* Alternative URL shortening strategies
- [ ] Custom URLs for premium users
- [ ] Series of random dictionary words
* Voting on URLs
- [x] Add a Vote model
- [x] Users can upvote (+1) or downvote(-1)
- [x] No more than one vote per user/url combo
- [x] Users cannot vote for their own URLs
- [ ] `ShortenedUrl::top`, sorted by total vote score
- [ ] `ShortenedUrl::hot`, sorted by vote score in the last (n) minutes    
