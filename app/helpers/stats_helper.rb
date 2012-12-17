module StatsHelper
  
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
