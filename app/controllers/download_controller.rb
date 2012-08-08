class DownloadController <  ApplicationController
  def books
    book = Book.find(params[:id])
    @path = book.epub_file.url
    download_path
  end

  def books_thumb
    book = Book.find(params[:id])
    @path = book.cover_m.url
    download_path
  end

  def activities
    activity = Activity.find(params[:id])
    @path = activity.content_file.url
    download_path
  end

  def activities_thumb
    activity = Activity.find(params[:id])
    @path = activity.thumbnail.url
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
