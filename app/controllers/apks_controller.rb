#encoding: UTF-8
class ApksController < ApplicationController
  protect_from_forgery :except => :get_updates
  skip_before_filter :admin_signed_in_required, :only => :get_updates
  before_filter :super_admin_required,  :only => [:index, :show, :new, :edit, :create, :update, :destroy]

  def lookup_permission apk_id
    @permission = DownloadPermission.where(resource_id:apk_id, resource_type:"Apk").all
  end

  # GET /apks
  # GET /apks.json
  def index
    if params[:app_id] && (@app = App.find params[:app_id])
      @apks = @app.apks
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @apks }
      end
    else
      respond_to do |format|
        format.html { redirect_to controller: :apps, action: :index }
        format.json { render json: [] }
      end
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
    @apk = Apk.new(app_id: params[:app_id])

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
        DownloadPermission.add_permission_from_params @apk.id, "Apk", true, params

        format.html { redirect_to app_apks_path, notice: "成功上传#{Apk.zh_name}" }
        format.json { render json: @apk, status: :created, location: @apk }
      else
        format.html { render action: :new, app_id: params[:app_id] }
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
        update_permission

        format.html { redirect_to @apk, notice: "成功更新#{Apk.zh_name}" }
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
    @current_user = get_user_from_token
    if @current_user
      latest = Apk.latest
    else
      latest = Apk.latest_daemon
    end

    pkgs_json = JSON(params[:packages])
    installed = {}
    pending = []
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

  private
  def super_admin_required
    unless current_admin.is_super
      flash[:error] = "对不起，您没有权限进行此操作"
      redirect_to root_url
    end
  end
end
