#encoding: UTF-8

require 'spec_helper'

describe MachinesController do

  describe "#Sign_in" do
    before :all do
      MachineType.create name: "7寸晓书", size: "800*480", android_version: "2.2"
      MachineType.create name: "8寸晓书", size: "1024*768", android_version: "4.0.3"

      School.create name: "阳光书屋", location: "北京市海淀区苏州街"
      School.create name: "四坝九年制学校", location: "甘肃省武威市四坝镇"
      School.create name: "和寨九年制学校", location: "甘肃省武威市永昌镇"
      School.create name: "贺家中学", location: "湖南省衡阳市衡山县贺家乡"
      School.create name: "贺家中心完小", location: "湖南省衡阳市衡山县贺家乡"

      Classroom.create school_id: 2, class_of: 2015, class_order: 1
      Classroom.create school_id: 2, class_of: 2015, class_order: 2
      Classroom.create school_id: 2, class_of: 2015, class_order: 3

      begin
        User.create name: "杨同学", birthday: "1995-6-1", school_id: 2, classroom_id: 1, user_type: "student"
        User.create name: "杨老师", birthday: "1970-12-22", school_id: 2, user_type: "teacher"
      rescue ActiveRecord::RecordNotUnique
        puts "[RecordNotUnique] Once spork is running, you can not create User."
      end
    end

    it "allow a student sign in" do
      info = {"machine_id"=>"KKDLA1232", "android_version"=>"4.0.3", "name"=>"杨同学",
              "user_type"=>"student", "school_id"=>"2", "grade"=>"7", "class"=>"1",
              "birthday"=>"1995-06-01", "format"=>"json"}

      post :sign_in, info

      response.body.should match ':"200"'
    end

    it "allow a teacher sign in" do
      info = {"machine_id"=>"KKDLA1232", "android_version"=>"4.0.3", "name"=>"杨老师",
              "user_type"=>"teacher", "school_id"=>"2", "birthday"=>"1970-12-22", "format"=>"json"}

      post :sign_in, info

      response.body.should match ':"200"'
    end
  end

end