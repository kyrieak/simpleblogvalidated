class Product < ActiveRecord::Base
  attr_accessible :description, :imageurl, :price, :size, :title

  validates :description, :presence => true, length: => { maximum: 250 }
  validates :imageurl, :presence => true
  validates :url_format_check
  validates :price, :presence => true,  :decimal, :scale => 2
  validates :size, :presence => true, inclusion: { in: %w(small medium large) }
  validates :title, :presence => true, :uniqueness => true, length: => { maximum: 50 }

  def url_format_check
    has_correct_suffix && has_correct_url_format
  end

  def has_correct_suffix
    [/\.jpg$/, /\.gif$/, /\.png$/].include? :imageurl
  end

  def has_correct_url_format
    :imageurl =~  /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/
  end

end
