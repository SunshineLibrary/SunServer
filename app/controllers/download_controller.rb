class DownloadController <  ApplicationController
  def books
    book = Book.find(params[:id])
    @path = book.epub_file.url
    download_path
  end
  
  DEFAULT_BOOKS_THUMB = "/default/default_books_thumb.jpg"
  DEFAULT_ACTIVITIES_THUMB = "/default/default_activities_thumb.png"
  
  def books_thumb
    book = Book.find(params[:id])
    if book.cover_m? 
      @path = book.cover_m.url
    else
      @path = DEFAULT_BOOKS_THUMB
    end
                  
    download_path
  end

  def book_collections_thumb
    book_collection = BookCollection.find(params[:id])
    @path = DEFAULT_BOOKS_THUMB
    
    if book_collection.books.count > 0
      book = book_collection.books.first
      if book.cover_m? 
        @path = book.cover_m.url      
      end
    end
    
    download_path
  end

  def apks
    apk = Apk.find(params[:id])
    @path = apk.file.url
    download_path
  end

  def activities
    activity = Activity.find(params[:id])
    @path = activity.content_file.url
    download_path
  end

  def activities_thumb
    activity = Activity.find(params[:id])
    if activity.thumbnail?
      @path = activity.thumbnail.url
    else
      @path = DEFAULT_ACTIVITIES_THUMB
    end
    
    download_path
  end

  def images
    image = Image.find(params[:id])
    @path = image.image_file.url
    download_path
  end

  def images_thumb
    image = Image.find(params[:id])
    @path = image.image_file.url :thumb
    download_path
  end

  private
  def download_path
    if @path.nil?
      render :nothing => true, :status => 404
    else
      redirect_to @path
    end
  end
end
