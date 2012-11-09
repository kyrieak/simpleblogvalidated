class ArticlesController < ApplicationController
  # GET /articles
  # GET /articles.json
  def index
    # @articles = Article.ordered_by(params[:order_by])
    logger.info {p params}
    @order_by = "ob=title"

    @articles = Article.scoped

    case params[:ob]
    when "title"
      @articles = @articles.order('title DESC')
    when 'word_count'
      @articles = @articles.order("LENGTH(body) - LENGTH(REPLACE(body, ' ', ''))  + 1 DESC")
    else
      @articles = @articles.order('created_at DESC')
    end

    if params[:limit]
      @articles = Article.only(params[:limit].to_i)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @articles }
    end
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @article  = Article.includes(:comments).find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @article }
    end
  end

  # GET /articles/new
  # GET /articles/new.json
  def new
    @article = Article.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @article }
    end
  end

  # GET /articles/1/edit
  def edit
    @article = Article.find(params[:id])
  end

  # POST /articles
  # POST /articles.json
  def create
    # @article = Article.new(params[:article])
    @article = Article.new(:title => params[:article][:title], :body => params[:article][:body])

    @article = Article.new(params[:article])

    # @article.title = params[:article][:title]
    # @article.body  = params[:article][:body]

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render json: @article, status: :created, location: @article }
      else
        format.html { render action: "new" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /articles/1
  # PUT /articles/1.json
  def update
    @article = Article.find(params[:id])

    respond_to do |format|
      if @article.update_attributes(params[:article])
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    respond_to do |format|
      format.html { redirect_to articles_url }
      format.json { head :no_content }
    end
  end
end
