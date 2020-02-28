class CommentsController < InheritedResources::Base
  before_action :authenticate_user!

  private

    def comment_params
      params.require(:comment).permit(:post_id, :content)
    end

end
