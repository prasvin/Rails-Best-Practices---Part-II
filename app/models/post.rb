class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user

  validates_presence_of :title
  validates_presence_of :text

  def recent_commenters
    self.comments.recent(5).collect{|comment| comment.user.login}.map{|commenter| "<li>#{commenter}</li>"}.join("")
  end

  def popular_posts
    self.find_each.collect{|p| p if p.comments.length > 10}.compact
  end

  def to_params
    "#{self.id}-#{self.name}"
  end

end

