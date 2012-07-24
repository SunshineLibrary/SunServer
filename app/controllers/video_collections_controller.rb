class VideoCollectionsController < ApplicationController
  # GET /video_collections
  # GET /video_collections.json
  def index
    @video_collections = VideoCollection.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @video_collections }
    end
  end

  # GET /video_collections/1
  # GET /video_collections/1.json
  def show
    @video_collection = VideoCollection.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @video_collection }
    end
  end

  # GET /video_collections/new
  # GET /video_collections/new.json
  def new
    @video_collection = VideoCollection.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @video_collection }
    end
  end

  # GET /video_collections/1/edit
  def edit
    @video_collection = VideoCollection.find(params[:id])
  end

  # POST /video_collections
  # POST /video_collections.json
  def create
    @video_collection = VideoCollection.new(params[:video_collection])

    respond_to do |format|
      if @video_collection.save
        format.html { redirect_to @video_collection, notice: 'Video collection was successfully created.' }
        format.json { render json: @video_collection, status: :created, location: @video_collection }
      else
        format.html { render action: "new" }
        format.json { render json: @video_collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /video_collections/1
  # PUT /video_collections/1.json
  def update
    @video_collection = VideoCollection.find(params[:id])

    respond_to do |format|
      if @video_collection.update_attributes(params[:video_collection])
        format.html { redirect_to @video_collection, notice: 'Video collection was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @video_collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /video_collections/1
  # DELETE /video_collections/1.json
  def destroy
    @video_collection = VideoCollection.find(params[:id])
    @video_collection.destroy

    respond_to do |format|
      format.html { redirect_to video_collections_url }
      format.json { head :ok }
    end
  end
end
