class BlogsController < ApplicationController
  
  before_filter :authorize, :except => [:index, :show]
  # GET /blogs
  # GET /blogs.xml
  def index
    @head_title = "News"
    #@blogs = Blog.page(1)
    @all_blogs = Blog.all
    @blogs = Blog.order("id DESC").page(params[:page]).per(5)
    
    
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @blogs }
      format.rss { render :layout => false } #index.rss.builder
    end
  end

  # GET /blogs/1
  # GET /blogs/1.xml
  def show
    
    @blog = Blog.find(params[:id])
    @head_title = "News #{@blog.created_at.strftime("%d/%m/%y")}"

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @blog }
    end
  end

  # GET /blogs/new
  # GET /blogs/new.xml
  def new
    @head_title = "New post"
    @blog = Blog.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @blog }
    end
  end

  # GET /blogs/1/edit
  def edit
    @head_title = "Edit post"
    @blog = Blog.find(params[:id])
  end

  # POST /blogs
  # POST /blogs.xml
  def create
    @blog = Blog.new(params[:blog])

    respond_to do |format|
      if @blog.save
        format.html { redirect_to(@blog, :notice => 'Blog was successfully created.') }
        format.xml  { render :xml => @blog, :status => :created, :location => @blog }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @blog.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /blogs/1
  # PUT /blogs/1.xml
  def update
    @blog = Blog.find(params[:id])

    respond_to do |format|
      if @blog.update_attributes(params[:blog])
        format.html { redirect_to(@blog, :notice => 'Blog was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @blog.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.xml
  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy

    respond_to do |format|
      format.html { redirect_to(blogs_url) }
      format.xml  { head :ok }
    end
  end
end
