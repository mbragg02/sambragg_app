class GigsController < ApplicationController
  
  before_filter :authorize, :except => [:index, :show]
  
  
  # GET /gigs
  # GET /gigs.xml
  def index
    @head_title = "Gigs"
    now = DateTime.now
    all_gigs = Gig.all
    
   # @blogs = Blog.order("id DESC").page(params[:page]).per(5)
  # ('gigdate <=?', DateTime.now)
   
   
   #@all_gigs = Gig.page(params[:page]).per(5).order("id DESC")
   @old_gigs = Gig.page(params[:page]).per(5).order("id DESC").where('gigdate <=?', DateTime.now)
    
    
   # @old_gigs = Gig.find(:all,
    #:conditions => ['gigdate <=?', DateTime.now]) 
    
    
    @new_gigs = Gig.find(:all,
    :conditions => ['gigdate > ?', DateTime.now]) 

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => all_gigs }
    end
  end

  # GET /gigs/1
  # GET /gigs/1.xml
  def show
    @gig = Gig.find(params[:id])
    @head_title = "Gig @ #{@gig.name}"
    

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @gig }
    end
  end

  # GET /gigs/new
  # GET /gigs/new.xml
  def new
    @head_title = "New Gig"
    @gig = Gig.new
    
    

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @gig }
    end
  end
  
  def geocode
    
    #geocode_url = "http://maps.googleapis.com/maps/api/geocode/json?address=#{address}&sensor=false"
    
    
    respond_to do |format|
      if @gig.save
        format.html { redirect_to(@gig, :notice => 'Gig was successfully created.') }
        format.xml  { render :xml => @gig, :status => :created, :location => @gig }
        format.js
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @gig.errors, :status => :unprocessable_entity }
        format.js
      end
    end
  end

  # GET /gigs/1/edit
  def edit
    @head_title = "Edit Gig"
    @gig = Gig.find(params[:id])
  end

  # POST /gigs
  # POST /gigs.xml
  def create
     require 'open-uri'
      require 'json'
      
    @gig = Gig.new(params[:gig])
    
    address = params[:gig][:address]
    geocode_url = "http://maps.googleapis.com/maps/api/geocode/json?address=#{address.gsub(/ /,'+')}&sensor=false"
    geocode_json = open(geocode_url).read
    geocode_parsed = JSON.parse(geocode_json)
    geo_lat = geocode_parsed["results"][0]["geometry"]["location"]["lat"]
    geo_lng = geocode_parsed["results"][0]["geometry"]["location"]["lng"]
    params[:gig][:lat] = geo_lat
    params[:gig][:lng] = geo_lng

    respond_to do |format|
      if @gig.update_attributes(params[:gig])
        format.html { redirect_to(@gig, :notice => "Gig was successfully created.") }
        format.xml  { render :xml => @gig, :status => :created, :location => @gig }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @gig.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /gigs/1
  # PUT /gigs/1.xml
  def update
    
    require 'open-uri'
    require 'json'
      
    @gig = Gig.find(params[:id])
    
    address = params[:gig][:address]
    geocode_url = "http://maps.googleapis.com/maps/api/geocode/json?address=#{address.gsub(/ /,'+')}&sensor=false"
    geocode_json = open(geocode_url).read
    geocode_parsed = JSON.parse(geocode_json)
    geo_lat = geocode_parsed["results"][0]["geometry"]["location"]["lat"]
    geo_lng = geocode_parsed["results"][0]["geometry"]["location"]["lng"]
    params[:gig][:lat] = geo_lat
    params[:gig][:lng] = geo_lng

    respond_to do |format|
      if @gig.update_attributes(params[:gig])
        format.html { redirect_to(@gig, :notice => 'Gig was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @gig.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /gigs/1
  # DELETE /gigs/1.xml
  def destroy
    @gig = Gig.find(params[:id])
    @gig.destroy

    respond_to do |format|
      format.html { redirect_to(gigs_url) }
      format.xml  { head :ok }
    end
  end
end
