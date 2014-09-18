def random_datetime(options={})
  end_time = Time.now
  start_time = options[:start_time] || end_time.send(:ago, (options[:interval] || 15.days))
  Time.at((end_time.to_f - start_time.to_f)*rand + start_time.to_f)
end

puts 'Deleting objects'
Category.delete_all
Post.delete_all
Tag.delete_all
Guest.delete_all
Comment.delete_all

puts 'Creating categories'
categories = %w(personal work family fun).map {|category| Category.create! name: category }

puts 'Creating tags'
tags = %w(ruby rails programming fun sql orm javascript bbq movie).map { |tag| Tag.create! name: tag }



puts 'Creating posts'
posts = ['new year resolutions', 'january weather', 'movie reviews', 'easter overload', 'spring sunburn', 'favourite foods', 'funny film', 'h8rs gotta h8'].map {|post| Post.create! name: post, category_id: categories.sample.id, published_at: random_datetime }

puts 'Adding tags to posts'
posts.each { |post| post.tags << tags.sample(rand(tags.length)) }

puts 'Commenting on posts'
comments = (1..100).map do |i| 
  post = posts.sample
  Comment.create! comment: "comment #{i}", post_id: post.id, published_at: random_datetime(start_time: post.published_at)
end

puts 'Creating guests'
guests = %w(james geraud kim michael ankoor andrea will anna luke)
comments.each { |comment| Guest.create! name: guests.sample, comment_id: comment.id }




