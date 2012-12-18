#encoding: UTF-8

class Book < ActiveRecord::Base
  has_attached_file :epub_file, {
    :path => ":rails_root/public/system/:attachment/:id/:style/:hash.:extension",
    :url => "/system/:attachment/:id/:style/:hash.:extension",
    :hash_secret => "longSecretString"
  }

  has_attached_file :cover_m, :styles => {
    :normal => "309x432"
  }

  has_attached_file :cover_s,
    :styles => {
    :normal => "103x144#"}

  belongs_to :provider
  belongs_to :book_collection
  belongs_to :author
  has_many :user_record, :as => :item
  has_many :users, :through => :user_records

  validates :title, :presence =>true

  ZN_NAME = "图书"

  def self.zh_name
    ZN_NAME
  end

  def author= name
    if name == 'Miss'
      return
    end
    if res = Author.where(name:name).first
      self.author_id = res.id
    else
      self.build_author name:name
    end
  end

  def author
    if author_id.nil?
      return 'Miss'
    end
    if res = Author.where(id:author_id).first
      res.name
    else
      'Miss'
    end
  end

  def author_intro
    if author_id.nil?
      return 'Miss'
    end
    if res = Author.where(id:author_id).first
      res.intro
    else
      'Miss'
    end
  end

  def book_collection
    if book_collection_id.nil?
      return "Doesn't belong to any"
    end
    if res = BookCollection.find_by_id(book_collection_id)
      res.title
    else
      "Doesn't belong to any"
    end
  end

  def book_collection_id= bc_id
    if bc_id == "-1"
      self.build_book_collection title:self.title, intro:self.intro
    else
      super(bc_id)
    end
  end

  def provider
    if provider_id.nil?
      return 'Miss'
    end
    if res = Provider.find_by_id(provider_id)
      res.name
    else
      'Miss'
    end
  end

  def tag_ids
    books_tags_item = MengBooksTags.where(book_id: self.id).select {|item| not item.destroyed?}
    books_tags_item.map{|item| item.tag_id}
  end

  def tags
    self.tag_ids.map {|tag_id| Tag.find_by_id tag_id}
  end

  def update_tags new_tag_ids
    if not new_tag_ids.nil?
      old_ids = self.tag_ids
      for temp_id in old_ids
        if not new_tag_ids.include? temp_id
          btitem = BooksTags.where(book_id: self.id, tag_id: temp_id).first
          btitem.soft_destroy
        end
      end
      for temp_id in new_tag_ids
        if not old_ids.include? temp_id
          BooksTags.create book_id: self.id, tag_id: temp_id
        end
      end
    end
    true
  end

  def url
    ""
  end

  def url= douban_url
    begin
      book_id = douban_url.match(/\/(\d+)\//).captures[0]
      resDic = Book.crawl book_id

      self.title = resDic["标题"]
      self.author = resDic["作者"]
      self.ISBN = resDic["ISBN"]
      self.publication_year = resDic["出版年"]
      self.publisher = resDic["出版社"]
      self.intro = resDic["内容简介"]

      require 'open-uri'
      open(resDic["cover_m"]) do |f|
        self.cover_m = f
      end
      open(resDic["cover_s"]) do |f|
        self.cover_s = f
      end
    rescue
      puts "url parsing error"
    end
  end

  def self.crawl book_id
    require 'wombat'
    crawl_res = Wombat.crawl do
      base_url "http://book.douban.com"
      path "/subject/#{book_id}"

      title "xpath=//div[@id='wrapper']//h1"
      data_block "xpath=//div[@id='info']"
      info "xpath=//div[@class='related_info']/div[@class='indent']"

      cover_m "xpath=//div[@id='mainpic']//@href"
      cover_s "xpath=//div[@id='mainpic']//@src"
    end
    spliter = ["副标题", "作者", "原作者", "原作名", "出版社","页数", "出版年", "定价", "装帧","丛书","ISBN", "译者"]

    s = crawl_res["data_block"]
    s_array = s.split(':')

    resDic = {"标题" => crawl_res["title"], "内容简介" => crawl_res["info"], "cover_m" => crawl_res["cover_m"],
      "cover_s" => crawl_res["cover_s"]}
    key_str = s_array[0]
    for i in 0..s_array.count-2
      if i == s_array.count-2
        postfix = ""
      else
        postfix = Book.findPostfixSpliter(spliter, s_array[i+1])
      end
      val_str = s_array[i+1][0..(-1 * postfix.length - 1)]
      resDic[key_str] = val_str.strip
      key_str = postfix
    end

    resDic
  end

  def as_json(options = {})
    json = super(options)
    json[:author] = author
    json
  end

  private
  def Book.findPostfixSpliter(spliter, s)
    spliter.each do |sr|
      return sr if s.end_with? sr
    end
  end

  def Book.sequence_after(timestamp, limit)
    return ApiModelHelper.sequence_after(Book, timestamp, limit)
  end
end
