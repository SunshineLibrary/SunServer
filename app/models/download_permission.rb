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
      end

      params[:permission_grades].each do |id_str|
          DownloadPermission.add_permission id_str.to_i, "Grade", resource_id, resource_type, pboolean
      end

      params[:permission_classrooms].each do |id_str|
          DownloadPermission.add_permission id_str.to_i, "Classroom", resource_id, resource_type, pboolean
      end

      params[:permission_users].each do |id_str|
          DownloadPermission.add_permission id_str.to_i, "User", resource_id, resource_type, pboolean
      end
  end
end
