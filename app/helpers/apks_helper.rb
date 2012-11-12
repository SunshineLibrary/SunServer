#encoding: UTF-8

module ApksHelper
  def get_name owner_id, owner_type
    case owner_type
      when "Grade"
        return owner_id.to_s + "年级"
      when "School"
        return School.find(owner_id).name
      when "Classroom"
        return Classroom.find(owner_id).class_name_with_school
      when "User"
        return "学生" if owner_id == 1
        return "老师" if owner_id == 2
        return "员工"
      end
  end

  def allow_list
    res = []
    @permission.each do |p|
      if p.permission_boolean
        res << get_name(p.owner_id, p.owner_type)
      end
    end
    res
  end
end
