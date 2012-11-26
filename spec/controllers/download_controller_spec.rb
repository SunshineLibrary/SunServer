#encoding: UTF-8
require "spec_helper"

describe DownloadController do

  describe "it manage authentication right" do
    before :all do
      provider = Provider.create name: "阳光书屋", intro:"神秘组织，不崇拜星辰诸神"
      intro = "哈利·波特与凤凰社》是“哈利·波特”系列的第五部。"
      author = Author.create name: "J.K 罗琳"
      collection = BookCollection.create title: "哈利·波特与凤凰社", intro: intro
        book = collection.books.create title: "哈利·波特与凤凰社1", intro: intro, author: author, provider_id: provider.id

      DownloadPermission.create owner_id: 1, owner_type: "Classroom", resource_id: book.id, resource_type: "Book", permission_boolean: true
      DownloadPermission.create owner_id: 2, owner_type: "School", resource_id: book.id, resource_type: "Book", permission_boolean: true
      DownloadPermission.create owner_id: 1, owner_type: "User", resource_id: book.id, resource_type: "Book", permission_boolean: true
      DownloadPermission.create owner_id: 2, owner_type: "User", resource_id: book.id, resource_type: "Book", permission_boolean: true

      @book_id = book.id
    end

    before :each do
      @student = User.new name: "杨同学", birthday: "1995-6-1", school_id: 2, classroom_id: 1, user_type: "student"
      @teacher = User.new name: "杨老师", birthday: "1970-1-1", school_id: 2, user_type: "teacher"
      @staff = User.new name: "杨杨杨", birthday: "1995-6-1", school_id: 2, user_type: "staff"
    end

    it "permit the student to download authorized books" do
      fill_valid_user_and_check @student
    end

    it "forbid a ill student to download book" do
      @student.classroom_id = 2
      fill_ill_user_and_check @student
    end

    it "permit the teacher to download authorized book" do
      fill_valid_user_and_check @teacher
    end

    it "forbid a ill teacher to download book" do
      @teacher.school_id = 1
      fill_ill_user_and_check @teacher
    end

    it "forbit a ill staff to download book" do
      fill_ill_user_and_check @staff
    end

    def fill_valid_user_and_check user
      controller.should_receive(:get_user_from_token).and_return user
      controller.check_permission("books", @book_id).should be_true
    end

    def fill_ill_user_and_check user
      controller.should_receive(:get_user_from_token).and_return user
      controller.check_permission("books", @book_id).should be_false
    end
  end
end