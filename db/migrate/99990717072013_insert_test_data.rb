class TestData < ActiveRecord::Migration
  def self.up
    down
    
    subject = Subject.create(:name => "数学")
    
    course = Course.create(:name => "初一数学（上）（人教版）", 
                  :editor => "阳光书屋", 
                  :subject_id => sub.id, 
                  :grade => 7, 
                  :semester => 1, 
                  :description => "适用于任何版本的数学（不仅限于人教版）")
                  
    chapter = Chapter.create(:name => "第1单元：有理数", 
                  :course_id => course.id,
                  :description => "无")               
                  
    lesson = Lesson.create(:name => "第1课：有理数的概念及概念性工具", 
                  :chapter_id => chapter.id,
                  :description => "有理数是什么？")         
                  
    section = Section.create(:name => "1.负数的概念", 
                  :lesson_id => lesson.id,
                  :description => "负数就是小于0的数")      
                  
    section = Section.create(:name => "2.负数的数学定义", 
                  :lesson_id => lesson.id,
                  :description => "在数轴上负数在0的左侧")  
                  
  end
  
  def self.down
    Subject.delete_all
    Course.delete_all
    Chapter.delete_all
    Lesson.delete_all
    Section.delete_all
    Activity.delete_all
    TextActivity.delete_all
    GalleryActivity.delete_all
    VideoActivity.delete_all
    AudioActivity.delete_all
    QuizActivity.delete_all
  end
  
end
