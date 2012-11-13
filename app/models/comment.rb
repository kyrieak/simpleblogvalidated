class Comment < ActiveRecord::Base
  belongs_to :article
  attr_accessible :body

  validates :comment, :length => { :maximum => 250 }
end
