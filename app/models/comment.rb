require_relative '../../lib/assets/text_validations'
class Comment < ActiveRecord::Base
  include TextValidation
  belongs_to :article
  attr_accessible :body

  # validates :comment, :length => { :maximum => 250 }
end
