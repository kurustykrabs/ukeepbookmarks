class LinksController < ApplicationController

  def create
    if params[:user_id]
      user = User.find(params[:user_id])
    end
    bookmark = Bookmark.find(params[:bookmark_id])
    link = bookmark.links.create(link_params.merge(user_id: current_user.id))
    if link.save
      if user
        redirect_to user_path(user), notice: 'Link saved.'
      else
        redirect_to bookmark_path(bookmark)
      end
    else
      if user
        redirect_to user_path(user), alert: 'There was an error.'
      else
        redirect_to bookmark_path(bookmark)
      end
    end
end

def destroy
  @link = Link.find(params[:id])
  @link.destroy
  redirect_to bookmark_path(current_user), notice: 'Your link has been deleted.'
end

def edit
  @link = Link.find(params[:id])
  @bookmark = @link.bookmark
end

  private

  def link_params
    params.require(:link).permit(:content)
  end

end
