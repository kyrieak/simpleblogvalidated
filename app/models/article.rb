class Article < ActiveRecord::Base
  has_many :comments, dependent: :destroy

  attr_accessible :body, :title

  # def self.by_user(user)
  #   where(:user_id => user.id)
  # end
  #
  # def self.by_recency
  #   order(:created_at).reverse_order
  # end
  #
  def self.only(lim)
    limit(lim)
  end
end