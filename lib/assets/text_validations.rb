module TextValidation

  def self.included(base)
     base.validates :body, :presence => true
     base.validates :body, :exclusion => {:in => %w(kitten)}
     base.validates :title, :presence => true if base.class == Article
     base.validates :length => { :maximum => 250 } if base.class == Comment
  end

end