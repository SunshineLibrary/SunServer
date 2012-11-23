require 'spec_helper'

describe Book do

  describe ".sequence_after with 10 random records" do
    before :each do
      10.times do |i|
        FactoryGirl.create(:book, updated_at: Time.at(rand(100)))
      end
    end

    it "returns a sorted sequence" do
      res = Book.sequence_after(0, 10)
      for i in 0..8
        res[i].updated_at.should <= res[i+1].updated_at
      end
    end

    it "returns all that are later than given timestamp" do
      10.times do
        timestamp = rand(100)
        res = Book.sequence_after(timestamp, 10)
        res.each do |r|
          r.updated_at.to_i.should >timestamp
        end
      end

      Book.all.each do |b|
        timestamp = b.updated_at.to_i
        res = Book.sequence_after(timestamp, 10)
        res.each do |r|
          r.updated_at.to_i.should >timestamp
        end
      end
    end
  end

  describe ".sequece_after Cut logic" do
    before :each do
      time = [1,2,3,3,3,4,5]
      time.each do |t|
        FactoryGirl.create :book, updated_at: Time.at(t)
      end
    end

    it "returns the sequence of accurate length on normal situation" do
      Book.sequence_after(0, 2).count.should ==2
      Book.sequence_after(3, 2).count.should ==2
      Book.sequence_after(2, 4).count.should ==4
    end

    it "ignore large limit" do
      Book.sequence_after(0, 100).count.should ==7
      Book.sequence_after(3, 5).count.should ==2
      Book.sequence_after(6, 1).count.should ==0
    end

    it "retains the tail with same updated time" do
      Book.sequence_after(1, 2).count.should ==4
      Book.sequence_after(0, 3).count.should ==5

      FactoryGirl.create :book, updated_at: Time.at(5)
      FactoryGirl.create :book, updated_at: Time.at(5)
      Book.sequence_after(3, 2).count.should ==4
    end
  end
end
