#encoding: UTF-8

class BookCollection < ActiveRecord::Base
  has_and_belongs_to_many :tags
  has_many :books

  has_attached_file :cover_m
  has_attached_file :cover_s

  ZN_NAME = "图书合集"

  def self.zh_name
    ZN_NAME
  end

  def BookCollection.selection
    #used for f.select in views
    bcollection = [["自动创建", -1]]
    BookCollection.all.each do |bc|
      next if bc.destroyed?
      bcollection<<[bc.title, bc.id]
    end
    bcollection
  end

  def as_json(options ={})
    json = super(options)
    
    if books.count > 0
      json[:author] = books.first.author
      json[:publisher] = books.first.provider
    else
      json[:author] = "Miss"
      json[:publisher] = "Miss"
    end
    
    json
  end
end
