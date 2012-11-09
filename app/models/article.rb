class Article < ActiveRecord::Base
  has_many :comments, dependent: :destroy

  attr_accessible :body, :title

  # def self.ordered_by(params)
  #   case params
  #     when 'title' then     Article.order('title')
  #     # when 'title' then     @articles = Article.find(:all, :order => 'title')
  #     when :published then Article.order('created_at DESC')
  #     when :word_count then Article.order('word_count')
  #     else                  Article.all
  #   end
  # end

end
