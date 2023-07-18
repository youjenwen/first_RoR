class Api::V1::ArticlesController < Api::BaseController
  before_action :find_article, only: [:show, :update, :destroy]
  
  def index
    articles = Article.all
    render json: articles, status: 200
  end

  def show
    # 因為 private 有共用方法原本區域變數需要改成實體變數
    if @article
      render json: @article, status: 200
    else
      render json:{
        error: "Article not found"
      }
    end
  end

  def create
    article = Article.new(arti_params)
    # new 裡面也可以這樣寫
    # article = Article.new(
    #   title: arti_params[:title],
    #   body: arti_params[:body],
    #   author: arti_params[:author]
    # )
    if article.save
      render json:article, status:200
    else
      render json:{
        error: "Error Creating.."
      }
    end
  end

  def update
    # 因為 private 有共用方法原本區域變數需要改成實體變數
    if @article
      #update裡面也可以這樣 article.update(title: params[:title], body: params[:body], author:  params[:autthor])
      @article.update(arti_params)
      render json: {
        success: "Article Record Update Successfully"
      }
    else
      render json:{
        error: "Article Not Found"
      }
    end
  end

  def destroy
    # 因為 private 有共用方法原本區域變數需要改成實體變數
    if @article
      @article.destroy
      render json: {
        success: "Article deleted finish!"
      }
    else
      render json:{
        error: "Article Not Found"
      }
    end
  end

  private
  def arti_params
    params.require(:article).permit([
      :title,
      :body,
      :author
    ])
  end

  def find_article
    @article = Article.find_by(id: params[:id])
  end
end
