# frozen_string_literal: false

class CommentsController < ApplicationController
  before_action :find_post, only: %i[create destroy]
  def create
    @comment = @post.comments.create(params_comments)

    redirect_to post_path(@post)
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy

    redirect_to post_path(@post)
  end

  private

  def params_comments
    params[:comment].permit(:title, :content)
  end

  def find_post
    @post = Post.find(params[:post_id])
  end
end
