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
  
end
