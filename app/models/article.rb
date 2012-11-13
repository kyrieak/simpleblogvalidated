class Article < ActiveRecord::Base
  has_many :comments, dependent: :destroy

  attr_accessible :body, :title, :comment, :kitten_hater

  validates :title, :presence => true
  validates :body, :presence => true
  validates :body, :exclusion => {:in => %w(kitten)}



  def self.only(lim)
    limit(lim)
  end
end