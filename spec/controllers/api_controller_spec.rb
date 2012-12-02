#encoding: UTF-8
require 'spec_helper'

describe ApiController do

  before :all do
    provider = Provider.create name: "阳光书屋", intro:"神秘组织，不崇拜星辰诸神"
    intro = "哈利·波特与凤凰社》是“哈利·波特”系列的第五部。"
    author = Author.create name: "J.K 罗琳"
    collection = BookCollection.create title: "哈利·波特与凤凰社", intro: intro
      book = collection.books.create title: "哈利·波特与凤凰社1", intro: intro, author: author, provider_id: provider.id
      book = collection.books.create title: "哈利·波特与凤凰社2", intro: intro, author: author, provider_id: provider.id
      book = collection.books.create title: "哈利·波特与凤凰社3", intro: intro, author: author, provider_id: provider.id
      book = collection.books.create title: "哈利·波特与凤凰社4", intro: intro, author: author, provider_id: provider.id
      book = collection.books.create title: "哈利·波特与凤凰社5", intro: intro, author: author, provider_id: provider.id

    subject = Subject.create name: "数学"
      course = subject.courses.create name: "初一数学(上)", grade: 7, semester: 1

    DownloadPermission.create owner_id: 1, owner_type: "Classroom", resource_id: book.id, resource_type: "Book", permission_boolean: true
    DownloadPermission.create owner_id: 2, owner_type: "School", resource_id: book.id, resource_type: "Book", permission_boolean: true
    DownloadPermission.create owner_id: 1, owner_type: "Classroom", resource_id: course.id, resource_type: "Course", permission_boolean: true
    DownloadPermission.create owner_id: 2, owner_type: "School", resource_id: course.id, resource_type: "Course", permission_boolean: true

    DownloadPermission.create owner_id: 1, owner_type: "User", resource_id: book.id, resource_type: "Book", permission_boolean: true
    DownloadPermission.create owner_id: 2, owner_type: "User", resource_id: book.id, resource_type: "Book", permission_boolean: true
    DownloadPermission.create owner_id: 3, owner_type: "User", resource_id: book.id, resource_type: "Book", permission_boolean: true
    DownloadPermission.create owner_id: 1, owner_type: "User", resource_id: course.id, resource_type: "Course", permission_boolean: true
  end

  before :each do
    @student = User.new name: "杨同学", birthday: "1995-6-1", school_id: 2, classroom_id: 1, user_type: "student"
    @teacher = User.new name: "杨老师", birthday: "1970-1-1", school_id: 2, user_type: "teacher"
    @staff = User.new name: "杨杨杨", birthday: "1995-6-1", school_id: 2, user_type: "staff"
  end

#  it "return a list of books if the user has permission" do
#    controller.should_receive(:get_user_from_token).and_return @student
#    controller.should_receive(:have_permission).at_least(:once).and_return true
#    get :books, {:format => :json, :limit => 1}
#    response.body.should_not == "[]"
#  end
#
#  it "return empty if the user can not find" do
#    controller.should_receive(:get_user_from_token).and_return nil
#    get :books, :format => :json
#    response.body.should == "[]"
#  end
#
#  it "permit the student user to access to an authorized book" do
#    fill_valid_user_and_get @student
#  end
#
#  it "forbit the student user with wrong classroom_id to access book" do
#    @student.classroom_id = 2
#    fill_ill_user_and_get @student
#  end
#
#  it "permit a teacher to access an authorized book" do
#    fill_valid_user_and_get @teacher
#  end
#
#  it "forbit a ill teacher to access book" do
#    @teacher.school_id = 3
#    fill_ill_user_and_get @teacher
#  end
#
#  it "permit a staff to access an authorized book" do
#    fill_valid_user_and_get @staff
#  end
#
#  it "forbit a ill staff to acces book" do
#    @staff.school_id = 1
#    fill_ill_user_and_get @staff
#  end
#
#  it "permit a student to access authorized course" do
#    fill_valid_user_and_get :courses, @student
#  end
#
#  it "forbit an ill student to access course" do
#    @student.classroom_id = 2
#    fill_ill_user_and_get :courses, @student
#  end
#
#  it "forbit a ill non-student to access course" do
#    fill_ill_user_and_get :courses, @staff
#    fill_ill_user_and_get :courses, @teacher
#  end

  def fill_valid_user_and_get action=:books, user
    controller.should_receive(:get_user_from_token).and_return user
    get action, {:format => :json, :limit => Book.all.count}
    response.body.should_not == "[]"
  end

  def fill_ill_user_and_get action=:books, user
    controller.should_receive(:get_user_from_token).and_return user
    get action, {:format => :json, :limit => Book.all.count}
    response.body.should == "[]"
  end
end
