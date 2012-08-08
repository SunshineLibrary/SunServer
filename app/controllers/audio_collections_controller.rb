class AudioCollectionsController < ApplicationController
  # GET /audio_collections
  # GET /audio_collections.json
  def index
    @audio_collections = AudioCollection.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @audio_collections }
    end
  end

  # GET /audio_collections/1
  # GET /audio_collections/1.json
  def show
    @audio_collection = AudioCollection.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @audio_collection }
    end
  end

  # GET /audio_collections/new
  # GET /audio_collections/new.json
  def new
    @audio_collection = AudioCollection.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @audio_collection }
    end
  end

  # GET /audio_collections/1/edit
  def edit
    @audio_collection = AudioCollection.find(params[:id])
  end

  # POST /audio_collections
  # POST /audio_collections.json
  def create
    @audio_collection = AudioCollection.new(params[:audio_collection])

    respond_to do |format|
      if @audio_collection.save
        format.html { redirect_to @audio_collection, notice: 'Audio collection was successfully created.' }
        format.json { render json: @audio_collection, status: :created, location: @audio_collection }
      else
        format.html { render action: "new" }
        format.json { render json: @audio_collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /audio_collections/1
  # PUT /audio_collections/1.json
  def update
    @audio_collection = AudioCollection.find(params[:id])

    respond_to do |format|
      if @audio_collection.update_attributes(params[:audio_collection])
        format.html { redirect_to @audio_collection, notice: 'Audio collection was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @audio_collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /audio_collections/1
  # DELETE /audio_collections/1.json
  def destroy
    @audio_collection = AudioCollection.find(params[:id])
    @audio_collection.destroy

    respond_to do |format|
      format.html { redirect_to audio_collections_url }
      format.json { head :ok }
    end
  end
end
