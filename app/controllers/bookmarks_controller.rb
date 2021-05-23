class BookmarksController < ApplicationController

  def index
  end

  def create
    @bookmark = current_user.bookmarks.create(bookmark_params)
    if @bookmark.save
      redirect_to bookmark_path(current_user)
    else
      render bookmark_path(current_user), notice:'Your bookmark has been saved.'
    end
  end

  def show
    @bookmark = Bookmark.find(params[:id])
    @link = Link.new
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to bookmark_path(current_user), notice: 'Your bookmark has been deleted.'
  end

  def edit
    @bookmark = Bookmark.find(params[:id])
    @user = @bookmark.user
  end

  def update
    @bookmark = Bookmark.find(params[:id])
    @bookmark.update(bookmark_params)
    if @bookmark.save
      redirect_to bookmark_path(current_user)
    else
      render bookmark_path(current_user), notice:'Your bookmark category has been updated.'
    end
  end

  private
    def bookmark_params
      params.require(:bookmark).permit(:category)
    end

end
