# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user1 = User.create({email: "test1@test.com", premium: true})
user2 = User.create({email: "test2@test.com", premium: false})
user3 = User.create({email: "test2@test.com", premium: false})

url1 = ShortenedUrl.create_for_user_and_long_url!(user1, "http://www.mbusa.com/mercedes/vehicles/class/class-E/bodystyle-SDN")
url2 = ShortenedUrl.create_for_user_and_long_url!(user1, "http://us.louisvuitton.com/eng-us/la-maison/a-legendary-history")
url3 = ShortenedUrl.create_for_user_and_long_url!(user1, "https://vimeo.com/channels/staffpicks/146064760")

url4 = ShortenedUrl.create_for_user_and_long_url!(user2, "https://www.youtube.com/watch?v=N4mEzFDjqtA")
url5 = ShortenedUrl.create_for_user_and_long_url!(user2, "http://www.newswise.com/articles/view/643315/?sc=rssn")
url6 = ShortenedUrl.create_for_user_and_long_url!(user2, "https://github.com/appacademy/sql-curriculum/blob/master/w3d4/relation.md")

url7 = ShortenedUrl.create_for_user_and_long_url!(user3, "http://www.tristatebmw.com/?gclid=Cj0KEQiApruyBRCFqoDu1pbk9rkBEiQAF8EFda1P8jfn02zzF98U8vbOPDFGZqbxuzmwY8nCOY2BfDQaAlM18P8HAQ")
url8 = ShortenedUrl.create_for_user_and_long_url!(user3, "http://www.ardendertat.com/2012/01/17/programming-interview-questions-26-trim-binary-search-tree/")
url9 = ShortenedUrl.create_for_user_and_long_url!(user3, "http://www.ardendertat.com/2012/01/26/programming-interview-questions-27-squareroot-of-a-number/")

tag1 = TagTopic.create({topic: "music"})
tag2 = TagTopic.create({topic: "programming"})
tag3 = TagTopic.create({topic: "news"})
tag4 = TagTopic.create({topic: "sports"})

Tagging.create({shortened_url_id: url1.id ,tag_topic_id: tag1.id })
Tagging.create({shortened_url_id: url2.id ,tag_topic_id: tag2.id })
Tagging.create({shortened_url_id: url3.id ,tag_topic_id: tag3.id })
Tagging.create({shortened_url_id: url4.id ,tag_topic_id: tag4.id })
Tagging.create({shortened_url_id: url5.id ,tag_topic_id: tag1.id })
Tagging.create({shortened_url_id: url6.id ,tag_topic_id: tag2.id })
Tagging.create({shortened_url_id: url7.id ,tag_topic_id: tag3.id })
Tagging.create({shortened_url_id: url8.id ,tag_topic_id: tag4.id })
Tagging.create({shortened_url_id: url9.id ,tag_topic_id: tag1.id })

Visit.record_visit!(user1, url7)
Visit.record_visit!(user1, url8)
Visit.record_visit!(user1, url9)
Visit.record_visit!(user1, url4)
Visit.record_visit!(user1, url5)
Visit.record_visit!(user1, url6)

Visit.record_visit!(user2, url1)
Visit.record_visit!(user2, url2)
Visit.record_visit!(user2, url3)
Visit.record_visit!(user2, url7)
Visit.record_visit!(user2, url8)
Visit.record_visit!(user2, url9)

Visit.record_visit!(user3, url1)
Visit.record_visit!(user3, url2)
Visit.record_visit!(user3, url3)
Visit.record_visit!(user3, url4)
Visit.record_visit!(user3, url5)
Visit.record_visit!(user3, url6)
Visit.record_visit!(user3, url7)
