class TagBundlesController < ApplicationController
  # GET /tag_bundles
  # GET /tag_bundles.json
  def index
    @tag_bundles = TagBundle.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tag_bundles }
    end
  end

  # GET /tag_bundles/1
  # GET /tag_bundles/1.json
  def show
    @tag_bundle = TagBundle.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tag_bundle }
    end
  end

  # GET /tag_bundles/new
  # GET /tag_bundles/new.json
  def new
    @tag_bundle = TagBundle.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tag_bundle }
    end
  end

  # GET /tag_bundles/1/edit
  def edit
    @tag_bundle = TagBundle.find(params[:id])
  end

  # POST /tag_bundles
  # POST /tag_bundles.json
  def create
    @tag_bundle = TagBundle.new(params[:tag_bundle])

    respond_to do |format|
      if @tag_bundle.save
        format.html { redirect_to @tag_bundle, notice: 'Tag bundle was successfully created.' }
        format.json { render json: @tag_bundle, status: :created, location: @tag_bundle }
      else
        format.html { render action: "new" }
        format.json { render json: @tag_bundle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tag_bundles/1
  # PUT /tag_bundles/1.json
  def update
    @tag_bundle = TagBundle.find(params[:id])

    respond_to do |format|
      if @tag_bundle.update_attributes(params[:tag_bundle])
        format.html { redirect_to @tag_bundle, notice: 'Tag bundle was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @tag_bundle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tag_bundles/1
  # DELETE /tag_bundles/1.json
  def destroy
    @tag_bundle = TagBundle.find(params[:id])
    @tag_bundle.destroy

    respond_to do |format|
      format.html { redirect_to tag_bundles_url }
      format.json { head :ok }
    end
  end
end
