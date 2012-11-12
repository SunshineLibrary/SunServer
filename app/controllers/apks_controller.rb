#encoding: UTF-8
class ApksController < ApplicationController
  protect_from_forgery :except => :get_updates
  skip_before_filter :admin_signed_in_required, :only => :get_updates

  def lookup_permission apk_id
    @permission = DownloadPermission.where(resource_id:apk_id, resource_type:"Apk").all
  end

  # GET /apks
  # GET /apks.json
  def index
    @apks = Apk.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @apks }
    end
  end

  # GET /apks/1
  # GET /apks/1.json
  def show
    @apk = Apk.find(params[:id])
    lookup_permission @apk.id

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @apk }
    end
  end

  # GET /apks/new
  # GET /apks/new.json
  def new
    @apk = Apk.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @apk }
    end
  end

  # GET /apks/1/edit
  def edit
    @apk = Apk.find(params[:id])
    lookup_permission @apk.id
  end

  # POST /apks
  # POST /apks.json
  def create
    @apk = Apk.new(params[:apk])

    respond_to do |format|
      if @apk.save
        @apk.parse_info
        @apk.save
        DownloadPermission.add_permission_from_params @apk.id, "Apk", true, params

        format.html { redirect_to apks_url, notice: '成功上传安装包' }
        format.json { render json: @apk, status: :created, location: @apk }
      else
        format.html { render action: "new" }
        format.json { render json: @apk.errors, status: :unprocessable_entity }
      end
    end
  end

  def eliminate_old_permission owner_type
    DownloadPermission.eliminate_old_permission @permission, owner_type, @apk.id, "Apk", params
  end

  def update_permission
    lookup_permission params[:id]

    eliminate_old_permission "School"
    eliminate_old_permission "Grade"
    eliminate_old_permission "Classroom"
    eliminate_old_permission "User"

    DownloadPermission.add_permission_from_params @apk.id, "Apk", true, params
  end

  # PUT /apks/1
  # PUT /apks/1.json
  def update
    @apk = Apk.find(params[:id])

    respond_to do |format|
      if @apk.update_attributes(params[:apk])
        @apk.parse_info
        @apk.save
        update_permission

        format.html { redirect_to @apk, notice: '成功更新安装包' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @apk.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apks/1
  # DELETE /apks/1.json
  def destroy
    @apk = Apk.find(params[:id])
    @apk.destroy

    respond_to do |format|
      format.html { redirect_to apks_url }
      format.json { head :ok }
    end
  end


  def get_updates
    latest = Apk.latest
    pkgs_json = JSON(params[:packages])
    pending = []
    installed = {}
    pkgs_json.each do |pkg_json|
      installed[pkg_json["name"]] = pkg_json["version"]
    end
    latest.each do |package|
      if installed[package.name].to_i < package.version  # nil.to_i = 0
        pending << package
      end
    end
    render json: pending
  end
end
