class DownloadController <  ApplicationController
  skip_before_filter :admin_signed_in_required
  # before_filter :permission_filter

  def permission_filter
    unless check_permission params[:action], params[:id]
      render :nothing => true, :status => 404
    end
  end

  def check_permission action_name, item_id
    if action_name.match(/book/).nil? and action_name.match(/apk/).nil?
      return true
    end

    if action_name.match /book/
      item_type = "Book"
    else
      item_type = "Apk"
    end

    @current_user = get_user_from_token
    if @current_user and DownloadPermission.check_user_with_resource @current_user, item_id.to_i, item_type
      return true
    else
      return false
    end
  end

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
    if activity.activity_type == 0
      redirect_to action: :text_activities, id: params[:id], format: :txt
    else
      @path = activity.content_file.url

      if activity.is_pdf
        @path = activity.get_pdf_file("TODO: get machine type once passed")
      end

      download_path
    end
  end

  def text_activities
    content = TextActivityContent.where(:text_activity_id => params[:id]).first
    if content
      render :text => content.content
    else
      render :nothing => true, :status => 404
    end
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
