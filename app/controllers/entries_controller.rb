class EntriesController < ApplicationController
  before_action :set_entry, only: [:show, :edit, :update, :destroy]

  # GET blogs/:blog_id/entries/1
  def show
    @comment = Comment.new
  end

  # GET blogs/:blog_id/entries/new
  def new
    @blog = Blog.find(params[:blog_id])
    @entry = Entry.new(blog_id: params[:blog_id])
  end

  # GET blogs/:blog_id/entries/1/edit
  def edit
  end

  # POST blogs/:blog_id/entries
  def create
    @entry = Entry.new(entry_params)
    @entry.blog_id = params[:blog_id]

    respond_to do |format|
      if @entry.save
        format.html { redirect_to blog_path(params[:blog_id]), notice: 'Entry was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT blogs/:blog_id/entries/1
  def update
    if @entry.update(entry_params)
      redirect_to blog_path(params[:blog_id]), notice: 'Entry was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE blogs/:blog_id/entries/1
  def destroy
    @entry.destroy
    redirect_to blog_path(params[:blog_id]), notice: 'Entry was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entry
      @entry = Entry.find_by(id:params[:id],blog_id:params[:blog_id])

      if @entry.nil?
        return render text:'パラメータ改ざんエラー', status:500
      end

      @blog = @entry.blog
      @comments = @entry.comments
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entry_params
      params.require(:entry).permit(:title, :body, :blog_id)
    end
end
