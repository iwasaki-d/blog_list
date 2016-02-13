class CommentsController < ApplicationController

  # POST blogs/:blog_id/entries/:entry_id/comments
  def create
    @comment = Comment.new(comment_params)
    @comment.status = 'unapproved'

    if @comment.save

      @mail = NoticeMailer.sendmail_confirm(@comment).deliver

      redirect_to blog_entry_path(redirect_params),notice: 'Comment was successfully created.'
    else
      redirect_to blog_entry_path(redirect_params),
                  flash: {create_error_count: @comment.errors.count, create_error_messages: @comment.errors.full_messages}
    end
  end

  # DELETE blogs/:blog_id/entries/:entry_id/comments/1
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to blog_entry_path(redirect_params),notice: 'Comment was successfully destroyed.'
  end

  # PUT blogs/:blog_id/entries/:entry_id/comments/1/approve
  def approve
    @comment = Comment.find(params[:id])
    @comment.status = 'approved'

    if @comment.save
      redirect_to blog_entry_path(redirect_params),notice: 'Comment was successfully approved.'
    else
      redirect_to blog_entry_path(redirect_params),
                  flash: {approve_error_count: @comment.errors.count, approve_error_messages: @comment.errors.full_messages}
    end
  end


  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params.require(:comment).permit(:body, :entry_id)
  end

  def redirect_params
    return {blog_id: params[:blog_id], id: params[:entry_id]}
  end

end
