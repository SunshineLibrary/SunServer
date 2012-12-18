class ApiController < ApplicationController
  respond_to :json
  before_filter :get_params
  skip_before_filter :admin_signed_in_required

  def ApiController.define_api_method(name, klass)
    method = lambda { handle_api_request(klass) }
    define_method(name, method)
  end

  define_api_method("subjects", Subject)
  define_api_method("courses", Course)
  define_api_method("chapters", Chapter)
  define_api_method("lessons", Lesson)
  define_api_method("sections", Section)

  define_api_method("activities", Activity)
  define_api_method("edges", Edge)
  define_api_method("gallery_images", Image)
  define_api_method("quiz_components", QuizComponent)
  define_api_method("section_components", SectionComponent)
  define_api_method("problems", Problem)
  define_api_method("problem_choices", ProblemChoice)

  define_api_method("authors", Author)
  define_api_method("books", Book)
  define_api_method("book_collections", BookCollection)
  define_api_method("tags", Tag)
  define_api_method("books_tags", MengBooksTags)
  define_api_method("book_collections_tags", MengBookCollectionsTags)

  private
  def get_params
    @timestamp, @limit = ApiModelHelper.parse_params(params)
  end

  UserString_To_Number = {"student" => 1, "teacher" => 2, "staff" => 3}

  private
  def have_permission item_id, klass
    return true if klass != Course and klass != Book

    DownloadPermission.check_user_with_resource @current_user, item_id, klass.to_s
  end

  def handle_api_request(klass)
    @current_user = get_user_from_token
    if @current_user
      @collection = ApiModelHelper.sequence_after(klass, @timestamp, @limit)
      respond_with @collection
      # respond_with @collection.select{|item| have_permission item.id, klass}
    else
      respond_with []
    end
  end
end
