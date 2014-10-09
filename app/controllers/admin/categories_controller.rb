class Admin::CategoriesController < Admin::AdminController

  # GET /categories
  # GET /categories.xml
  def index
    @categories = Category.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @categories }
    end
  end

  # GET /categories/new
  # GET /categories/new.xml
  def new
    @category = Category.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @category }
    end
  end

  # GET /categories/1/edit
  def edit
    @category = Category.find(params[:id])
  end

  # POST /categories
  # POST /categories.xml
  def create
    @category = Category.new(params.require(:category).permit!)

    #flash[:notice] = 'Category was successfully created.' if @category.save
    #respond_with @category, :location => admin_categories_path

    #respond_to do |format|
    #  if @category.save
    #    format.html { redirect_to(admin_categories_path, notice: 'Category was successfully created.') }
    #    format.xml  { render :xml => @category, :status => :created, :location => admin_categories_path}
    #  else
    #    format.html { render :action => "new" }
    #    format.xml  { render :xml => @category.errors, :status => :unprocessable_entity }
    #  end
    #end
  end

  # PUT /categories/1
  # PUT /categories/1.xml
  def update
    @category = Category.find(params[:id])
    flash[:notice] = 'Category was successfully updated.' if @category.update_attributes(params.require(:category).permit!)
    respond_with @category, :location => admin_categories_path
    #@category = Category.find(params[:id])

    #respond_to do |format|
    #  if @category.update_attributes(params.require(:category).permit!)
    #    format.html { redirect_to(admin_categories_path, :notice => 'Category was successfully updated.') }
    #    format.xml  { head :ok }
    #  else
    #    format.html { render :action => "edit" }
    #    format.xml  { render :xml => @category.errors, :status => :unprocessable_entity }
    #  end
    #end
  end

  # DELETE /categories/1
  # DELETE /categories/1.xml
  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    respond_with @category, :location => admin_categories_path
   # redirect_to admin_categories_path 
   # respond_to do |format|
    #  format.html { redirect_to(@category, :location => admin_categories_path) }
    #  format.xml  { head :ok }
    #end
  end
end
