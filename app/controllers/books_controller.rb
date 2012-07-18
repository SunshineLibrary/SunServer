class BooksController < ApplicationController
  
  DEFAULT_LIMIT = 100
  
  # GET /books
  # GET /books.json
  def index
    @books = Book.all
    
    if params[:timestamp]
      @books = @books.select{|b| b.updated_at.to_i >= params[:timestamp].to_i}.sort{|a,b| a.updated_at <=> b.updated_at}
    end    
    
    if params[:limit]
      @books = @books.first(params[:limit].to_i)
    else
      @books = @books.first(DEFAULT_LIMIT)
    end
     
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @books }
    end
  end
  
  # GET /books/1
  # GET /books/1.json
  def show
    @book = Book.find(params[:id])

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
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.create(params[:book])
    @book.update_tags(params[:tag_ids])
    
    respond_to do |format|
      if @book.save
        format.html {redirect_to books_url, notice:'Book was successfully created.'}
        format.json { render json: @book, status: :created, location: @book }
      else
        format.html { render action: "new" }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /books/1
  # PUT /books/1.json
  def update    
    @book = Book.find(params[:id])    
    
    respond_to do |format|
      if @book.update_attributes(params[:book]) and @book.update_tags(params[:tag_ids]) 
        format.html {redirect_to books_url, notice: 'Book was successfully updated.'}        
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
  
  def download    
    @book = Book.find(params[:id])    
    path = @book.epub_file.path
    
    send_file(path)
  end
end
