module SectionsHelper
  
  def get_all_lesson_option_list
    r = ""
    Course.all.each do |c|
      r << "<optgroup label='#{c.name}'>#{c.name}"
      c.chapters.each do |ch|
        r << "<optgroup label='#{ch.name}'>#{ch.name}"
        ch.lessons.each do |l|
          r << "<option value=#{l.id}>#{l.name}</option>"
        end  
        r << "</optgroup>"
      end
      r << "</optgroup>"
    end
    r
  end
  
  def get_all_lesson_option_list2
    r = "\n"
    Course.all.each do |c|
      r << "<optgroup label='#{c.name}'>#{c.name}"
      c.chapters.each do |ch|
        r << "<option value=#{ch.id}>#{ch.name}</option>"
      end
      r << "</optgroup>"
    end
    r
  end
  
  def get_all_lesson_option_list3
    r = "<select name='course_id' class='input-xlarge' name='course_id'>\n\n"
    Course.all.each do |c|
      next if c.destroyed?
      r << "<option value=#{c.id}>#{c.name}</option>\n\n"
    end
    r << "</select>"
  end
  
end
