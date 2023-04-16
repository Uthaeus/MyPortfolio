class CommentsController < ApplicationController
    before_action :set_blog, only: %i[ create ]

    def create 
        @comment = @blog.comments.build(comment_params)
        @comment.user = current_user
        @comment.save
    end

    private

    def set_blog
        @blog = Blog.friendly.find(params[:blog_id])
    end

    def comment_params
        params.require(:comment).permit(:content)
    end
end
