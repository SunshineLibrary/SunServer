#encoding: UTF-8
class BooksController < ApplicationController
  def lookup_permission book_id
    @permission = DownloadPermission.where(resource_id:book_id, resource_type:"Book").all
  end

  # GET /books
  # GET /books.json
  def index
    @books = Book.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @books }
    end
  end

  # GET /books/1
  # GET /books/1.json
  def show
    @book = Book.find(params[:id])
    lookup_permission @book.id

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @book }
    end
  end

  # GET /books/new
  # GET /books/new.json
  def new
    @book = Book.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @book }
    end
  end

  # GET /books/1/edit
  def edit
    @book = Book.find(params[:id])
    lookup_permission @book.id
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.create(params[:book])
    @book.update_tags(params[:tag_ids])

    if params["book"].include? "url"
      go_url = edit_book_url @book
    else
      go_url = books_url
    end

    respond_to do |format|
      if @book.save
        DownloadPermission.add_permission_from_params @book.id, "Book", true, params
        format.html { redirect_to go_url, notice:'成功创建图书'}
        format.json { render json: @book, status: :created, location: @book }
      else
        format.html { render action: "new" }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def eliminate_old_permission owner_type
    DownloadPermission.eliminate_old_permission @permission, owner_type, @book.id, "Book", params
  end

  def update_permission
    lookup_permission params[:id]

    eliminate_old_permission "School"
    eliminate_old_permission "Grade"
    eliminate_old_permission "Classroom"
    eliminate_old_permission "User"

    DownloadPermission.add_permission_from_params @book.id, "Book", true, params
  end

  # PUT /books/1
  # PUT /books/1.json
  def update
    @book = Book.find(params[:id])

    respond_to do |format|
      if @book.update_attributes(params[:book]) and @book.update_tags(params[:tag_ids])
        update_permission

        format.html {redirect_to books_url, notice: '信息已更新'}
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    respond_to do |format|
      format.html { redirect_to books_url }
      format.json { head :ok }
    end
  end
end
