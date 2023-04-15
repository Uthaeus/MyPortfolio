class CommentsController < ApplicationController
    before_action :set_blog, only: %i[ create ]

    def create 
        @comment = @blog.comments.build(comment_params)
        @comment.user = current_user
        @comment.save
        
        turbo_stream.replace(@blog, partial: 'comments/comment_form', locals: { comment: @comment })

    end

    private

    def set_blog
        @blog = Blog.friendly.find(params[:blog_id])
    end

    def comment_params
        params.require(:comment).permit(:content)
    end
end
