module StatsHelper
  
  def get_course_option_list
    r = ""
    Subject.all.each do |s|
      next if s.destroyed?
      r << "<optgroup label='#{s.name}'>"
      s.courses.each do |c|
        r << "<option value=#{c.id}>#{c.name}</option>"
      end
      r << "</optgroup>"
    end
    r
  end
      
  def get_section_option_list course
    r = ""
    course.chapters.each do |c|
      r << "<optgroup label='#{c.name}'>"
      c.lessons.each do |l|
        r << "<optgroup label='#{l.name}'>"
        l.sections.each do |s|
          r << "<option value=#{s.id}>#{s.name}</option>"
        end  
        r << "</optgroup>"
      end
      r << "</optgroup>"
    end
    r
  end
  
end
