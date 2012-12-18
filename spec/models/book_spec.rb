#encoding: UTF-8
require 'spec_helper'

describe Book do
  describe "#update_tags" do
    before :all do
      @tag1 = Tag.create name: "Tag1", tag_type: "Type1"
      @tag2 = Tag.create name: "Tag2", tag_type: "Type1"
      @tag3 = Tag.create name: "Tag3", tag_type: "Type2"
      @tag4 = Tag.create name: "Tag4", tag_type: "Type2"

      @tag_id_array = [@tag1.id, @tag2.id, @tag3.id, @tag4.id]
      @tag_arrary = [@tag1, @tag2, @tag3, @tag4]
    end

    before :each do
      @book = Book.create title: "我的小学和中学", author: "季羡林"
    end

    it "create a new book and set its tags right" do
      @book.update_tags @tag_id_array
      @book.tags.sort.should == @tag_arrary.sort
      @book.tag_ids.count.should == 4
    end

    it "update tags" do
      @book.update_tags @tag_id_array
      @book.update_tags [@tag1.id, @tag3.id]
      @book.tags.sort.should == [@tag1, @tag3].sort
    end

    it "distinguish soft destroyed tags" do
      @book.update_tags @tag_id_array
      BooksTags.where(book_id: @book.id, tag_id: @tag1.id).first.soft_destroy
      BooksTags.where(book_id: @book.id, tag_id: @tag2.id).first.soft_destroy
      @book.tag_ids.sort.should == [@tag3.id, @tag4.id].sort
      @book.tags.sort.should == [@tag3, @tag4].sort
    end
  end
end