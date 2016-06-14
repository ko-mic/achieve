class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  
  before_action :authenticate_user! 

  # GET /blogs
  # GET /blogs.json
  def index
    # raise
    @blogs = Blog.all
  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show
    # raise
  end

  # GET /blogs/new
  def new
    # raise
    @user = User.find(current_user.id)
    @blog = @user.blogs.build
  end

  # GET /blogs/1/edit
  def edit
    # raise
  end

  # POST /blogs
  # POST /blogs.json
  def create
    @user = User.find(current_user.id)
    @blog = @user.blogs.build(blog_params)

    respond_to do |format|
      if @blog.save
        #raise
        format.html { redirect_to @blog, notice: 'ブログ投稿が完了しました。' }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blogs/1
  # PATCH/PUT /blogs/1.json
  def update
    # raise
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: 'ブロク編集が完了しました。' }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    # raise
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'ブログ削除が完了しました。' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_params
      params.require(:blog).permit(:title, :content, :user_id)
    end
end
