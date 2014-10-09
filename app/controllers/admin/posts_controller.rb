class Admin::PostsController < Admin::AdminController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  before_filter :load_resources, :only => %w(new create edit update)
  
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])
    render :layout => "application"
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(params.require(:post).permit!)
    

    respond_to do |format|

     # flash[:notice] = 'Post was successfully created.'
      if @post.save
        format.html { redirect_to @post, :location => admin_posts_path, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: admin_posts_path }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    params[:post][:category_ids] ||= []
        
    @post = Post.find(params[:id])
    
    respond_to do |format|
	  
      if @post.update_attributes(params.require(:post).permit!)
        format.html { redirect_to @post, :location => admin_posts_path, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: admin_posts_path }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    respond_to do |format|
      format.html { redirect_to @post, :location => admin_posts_path, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
 
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :excerpt, :body)
    end


 protected
	def load_resources
		@categories = Category.all
		@authors = User.all
	end
	
	
end
