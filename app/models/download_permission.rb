class DownloadPermission < ActiveRecord::Base
  private
  def self.locate owner_id, owner_type, resource_id, resource_type
      DownloadPermission.where(owner_id: owner_id, owner_type: owner_type, resource_id: resource_id,
                              resource_type: resource_type)
  end

  def self.add_permission owner_id, owner_type, resource_id, resource_type, pboolean
      res = DownloadPermission.locate owner_id, owner_type, resource_id, resource_type
      if res.any?
          res = res.first
          res.permission_boolean = pboolean
          res.save
      else
          DownloadPermission.create owner_id: owner_id, owner_type: owner_type, resource_id: resource_id,
                                   resource_type: resource_type, permission_boolean: pboolean
      end
  end

  def self.check_permission owner_id, owner_type, resource_id, resource_type
      res = DownloadPermission.locate owner_id, owner_type, resource_id, resource_type
      return res.first.permission_boolean if res.any?
      false
  end

  def self.add_permission_from_params resource_id, resource_type, pboolean, params
      params[:permission_schools].each do |id_str|
          DownloadPermission.add_permission id_str.to_i, "School", resource_id, resource_type, pboolean
      end if params.has_key? 'permission_schools'

      params[:permission_grades].each do |id_str|
          DownloadPermission.add_permission id_str.to_i, "Grade", resource_id, resource_type, pboolean
      end if params.has_key? 'permission_grades'

      params[:permission_classrooms].each do |id_str|
          DownloadPermission.add_permission id_str.to_i, "Classroom", resource_id, resource_type, pboolean
      end if params.has_key? 'permission_classrooms'

      params[:permission_users].each do |id_str|
          DownloadPermission.add_permission id_str.to_i, "User", resource_id, resource_type, pboolean
      end if params.has_key? 'permission_users'
  end

  def self.prepare_allow_set resource_id, resource_type
    require 'set'
    res = {}
    for owner_type in ["School", "User", "Grade", "Classroom"]
      res[owner_type] = Set.new
      lookup = DownloadPermission.where(owner_type: owner_type, resource_id: resource_id, resource_type: resource_type, permission_boolean: true).all
      for owner in lookup
        res[owner_type] << owner.owner_id
      end
    end

    # Special treatment for User, allow all users at default.
    res["User"] = [1,2,3].to_set until res["User"].any?
    res
  end

  def self.eliminate_old_permission permission, owner_type, r_id, r_type, params
    require 'set'

    old_owner = permission.find_all{|p| p.owner_type == owner_type and p.permission_boolean}
    new_owner = Set.new
    if params.has_key? "permission_#{owner_type.downcase}s"
      new_owner = params["permission_#{owner_type.downcase}s"].map{|s| s.to_i}.to_set
    end

    for old_p in old_owner
      old = old_p.owner_id
      if not new_owner.include? old
        DownloadPermission.add_permission old, owner_type, r_id, r_type, false
      end
    end
  end

  def self.check_user_with_resource current_user, item_id, item_type
    #item_id = book.id, item_type = Book => resource
    #owner "student",
    if current_user.user_type == "student"
      perm_user = DownloadPermission.check_permission 1, "User", item_id, item_type
      return false unless perm_user
      perm_classroom = DownloadPermission.check_permission current_user.classroom_id, "Classroom", item_id, item_type
      return (perm_classroom and perm_user)
    else #"staff" or "teacher"
      user_type = current_user.user_type == "staff" ? 3 : 2
      perm_user = DownloadPermission.check_permission user_type, "User", item_id, item_type
      return false unless perm_user
      perm_school = DownloadPermission.check_permission current_user.school_id, "School", item_id, item_type
      return (perm_user and perm_school)
    end
  end
end
