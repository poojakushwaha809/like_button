class LikesController < ApplicationController
	def create
    @article = Article.find(params[:article_id])

    if already_liked?
      flash[:notice] = "You can't like more than once!"
    else
      @article.likes.create(user_id: current_user.id)
    end
    redirect_to  articles_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @like = @article.likes.find(params[:id])
    if !already_liked?
      flash[:notice] = "Can't unlike!"
    else
      @like.destroy
    end
        redirect_to  articles_path(@article)

  end

  private
    def already_liked?
      Like.where(user_id: current_user.id, article_id: params[:article_id]).exists?
    end
end
