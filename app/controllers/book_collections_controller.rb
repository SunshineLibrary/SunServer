class BookCollectionsController < ApplicationController
  # GET /book_collections
  # GET /book_collections.json
  def index
    @book_collections = BookCollection.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @book_collections }
    end
  end

  # GET /book_collections/1
  # GET /book_collections/1.json
  def show
    @book_collection = BookCollection.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @book_collection }
    end
  end
  
  # GET /book_collections/new
  # GET /book_collections/new.json
  def new    
    @book_collection = BookCollection.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @book_collection }
    end
  end

  # GET /book_collections/1/edit
  def edit
    @book_collection = BookCollection.find(params[:id])
  end

  # POST /book_collections
  # POST /book_collections.json
  def create    
    @book_collection = BookCollection.new(params[:book_collection])

    respond_to do |format|
      if @book_collection.save
        format.html { redirect_to @book_collection, notice: 'Book collection was successfully created.' }
        format.json { render json: @book_collection, status: :created, location: @book_collection }
      else
        format.html { render action: "new" }
        format.json { render json: @book_collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /book_collections/1
  # PUT /book_collections/1.json
  def update
    @book_collection = BookCollection.find(params[:id])

    respond_to do |format|
      if @book_collection.update_attributes(params[:book_collection])
        format.html { redirect_to @book_collection, notice: 'Book collection was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @book_collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /book_collections/1
  # DELETE /book_collections/1.json
  def destroy
    @book_collection = BookCollection.find(params[:id])
    @book_collection.destroy

    respond_to do |format|
      format.html { redirect_to book_collections_url }
      format.json { head :ok }
    end
  end
end
