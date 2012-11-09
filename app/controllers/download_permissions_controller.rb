class DownloadPermissionsController < ApplicationController
  # GET /download_permissions
  # GET /download_permissions.json
  def index
    @download_permissions = DownloadPermission.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @download_permissions }
    end
  end

  # GET /download_permissions/1
  # GET /download_permissions/1.json
  def show
    @download_permission = DownloadPermission.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @download_permission }
    end
  end

  # GET /download_permissions/new
  # GET /download_permissions/new.json
  def new
    @download_permission = DownloadPermission.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @download_permission }
    end
  end

  # GET /download_permissions/1/edit
  def edit
    @download_permission = DownloadPermission.find(params[:id])
  end

  # POST /download_permissions
  # POST /download_permissions.json
  def create
    @download_permission = DownloadPermission.new(params[:download_permission])

    respond_to do |format|
      if @download_permission.save
        format.html { redirect_to @download_permission, notice: 'Download permission was successfully created.' }
        format.json { render json: @download_permission, status: :created, location: @download_permission }
      else
        format.html { render action: "new" }
        format.json { render json: @download_permission.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /download_permissions/1
  # PUT /download_permissions/1.json
  def update
    @download_permission = DownloadPermission.find(params[:id])

    respond_to do |format|
      if @download_permission.update_attributes(params[:download_permission])
        format.html { redirect_to @download_permission, notice: 'Download permission was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @download_permission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /download_permissions/1
  # DELETE /download_permissions/1.json
  def destroy
    @download_permission = DownloadPermission.find(params[:id])
    @download_permission.destroy

    respond_to do |format|
      format.html { redirect_to download_permissions_url }
      format.json { head :ok }
    end
  end
end
