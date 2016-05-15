# URL Shortener
A simple CLI tool that takes an arbitrarily-long URL and will shorten it for the user. Subsequent users
can then give the short URL back to out tool and be redirected to the original URL.
This application also track clickthroughs, since these can be really helpful for business analytics.

URL-shortening apps are useful for embedding long URLs in space-constrained messages like tweets
This is inspired by [Google's shortener](https://goo.gl/)

## How to Use
`bundle install`
`rails runner bin/cli`

## Features
- Uses `SecureRandom::urlsafe_base64` to generate a 16 letter random
- adds "scope block" in `ShortenedUrl has_many :visitors` to remove duplicates
- script to handle user input is stored in `bin/cli`
- Uses `launchy` gem to pop open the original URL in a browser

## Bonus Implementations
- [x] TagTopic and Tagging: able to query for the most popular links in each category
- [x] Length of URL strings < 1024
- [x] no more than 5 urls are submitted in the last minute by one user, except premium users
- [x] `ShortenedUrl::prune` deletes any shortened urls that have not been visited in the last (n) minutes. Does not prune urls submitted by premium users.
- [x] Automate `ShortenedUrl::prune` in rake - download and create cron job for local machine
* Alternative URL shortening strategies
- [x] Custom URLs for premium users
- [x] Series of random dictionary words
* Voting on URLs
- [x] Add a Vote model
- [x] Users can upvote (+1) or downvote(-1)
- [x] No more than one vote per user/url combo
- [x] Users cannot vote for their own URLs
- [x] `ShortenedUrl::top`, sorted by total vote score
- [x] `ShortenedUrl::hot`, sorted by vote score in the last (n) minutes    
