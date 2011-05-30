class Comment < ActiveRecord::Base
  belongs_to :user

  scope :recent, order("created_at DESC")

  def commenter_address
    "#{self.user.address.city},#{self.user.address.country}"
  end

  def self.recent(count)
    self.recent.limit(count)
  end

  def is_minimum_length?
    true if self.text.length >= 4
  end

end

