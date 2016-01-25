class Review < ActiveRecord::Base

  belongs_to :game
  belongs_to :user
  belongs_to :platform

  has_many :comments, as: :commentable

  def calculate_average
    self.rate_average = (rate_story.to_i + rate_difficulty.to_i + rate_length.to_i + rate_mechanics.to_i + rate_audio.to_i + rate_performance.to_i + rate_art_style.to_i + rate_immersion.to_i) / 8
    save
  end

  def last_ten_comments
    comments.order(:created_at).reverse_order.limit(10)
  end

end
