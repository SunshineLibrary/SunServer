require 'spec_helper'

describe DownloadPermission do

  describe "#prepare_allow_set with a specific resource" do
    before :each do
      @school_set = []
      @user_set = []
      @classroom_set = []
    end

    it "fill allow_set[AllTeacher] correctly" do
      @school_set << mock_model(DownloadPermission, owner_id: 1)
      @school_set << mock_model(DownloadPermission, owner_id: 2)
      @user_set << mock_model(DownloadPermission, owner_id: 2)
      set_list_permit_return

      @allow_set["AllTeacher"].should include 1, 2
    end

    it "fill allow_set[AllTeacher] correctly [cont.]" do
      @school_set << mock_model(DownloadPermission, owner_id: 1)
      @school_set << mock_model(DownloadPermission, owner_id: 2)
      @user_set << mock_model(DownloadPermission, owner_id: 1)
      set_list_permit_return

      @allow_set["AllTeacher"].should_not include 1, 2
    end

    it "fill allow_set[AllStaff] correctly" do
      @school_set << mock_model(DownloadPermission, owner_id: 1)
      @school_set << mock_model(DownloadPermission, owner_id: 2)
      @user_set << mock_model(DownloadPermission, owner_id: 3)
      set_list_permit_return

      @allow_set["AllStaff"].should include 1, 2
    end

    it "fill allow_set[AllStaff] correctly [cont.]" do
      @school_set << mock_model(DownloadPermission, owner_id: 1)
      @school_set << mock_model(DownloadPermission, owner_id: 2)
      @user_set << mock_model(DownloadPermission, owner_id: 1)
      @user_set << mock_model(DownloadPermission, owner_id: 2)
      set_list_permit_return

      @allow_set["AllStaff"].should_not include 1, 2
    end

    it "fill allow_set[AllPeople] correctly" do

    end

    def set_list_permit_return
      DownloadPermission.should_receive(:list_permit).with("School", anything(), anything()).and_return @school_set
      DownloadPermission.should_receive(:list_permit).with("User", anything(), anything()).and_return @user_set
      DownloadPermission.should_receive(:list_permit).with("Classroom", anything(), anything()).and_return @classroom_set
      DownloadPermission.should_receive(:list_permit).with("Grade", anything(), anything()).and_return []
      @allow_set = DownloadPermission.prepare_allow_set 1, "Book"
    end
  end

  describe "#add_permission_from_params" do

  end

end