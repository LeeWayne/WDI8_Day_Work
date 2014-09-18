class Post < ActiveRecord::Base
  belongs_to :category
  has_many :comments
  has_many :tags
  
  attr_accessible :name, :category_id, :published_at

  default_scope where("name like ?", 'funny%')

  scope :published, where("posts.published_at is not null")
  scope :commented, joins(:comments).group('post_id').having('count(comments.post_id) > 0')
  scope :published_and_commented, published.commented
  scope :in_the_last_week, lambda { where("published_at > ?", Time.zone.now.ago(1.week)) }

  # scope :one_week_before, lambda { |time| where(published_at:(time.ago(1.week)..time)) }

  def self.one_week_before(time)
    where(published_at:(time.ago(1.week)..time) )
  end

end
