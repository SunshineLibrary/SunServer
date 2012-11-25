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
  define_api_method("books_tags", BooksTags)
  define_api_method("book_collections_tags", BookCollectionsTags)

  private
  def get_params
    @timestamp, @limit = ApiModelHelper.parse_params(params)
  end

  UserString_To_Number = {"student" => 1, "teacher" => 2, "staff" => 3}

  private
  def have_permission item_id, klass
    return true if klass != Course and klass != Book

    #item_id = book.id, klass = Book => resource
    #owner "student",
    if @current_user.user_type == "student"
      perm_user = DownloadPermission.check_permission 1, "User", item_id, klass.to_s
      return false unless perm_user
      perm_classroom = DownloadPermission.check_permission @current_user.classroom_id, "Classroom", item_id, klass.to_s
      return (perm_classroom and perm_user)
    else #"staff" or "teacher"
      user_type = @current_user.user_type == "staff" ? 3 : 2
      perm_user = DownloadPermission.check_permission user_type, "User", item_id, klass.to_s
      return false unless perm_user
      perm_school = DownloadPermission.check_permission @current_user.school_id, "School", item_id, klass.to_s
      return (perm_user and perm_school)
    end
  end

  def handle_api_request(klass)
    @current_user = get_user_from_token
    if @current_user
      @collection = ApiModelHelper.sequence_after(klass, @timestamp, @limit)
      respond_with @collection.select{|item| have_permission item.id, klass}
    else
      respond_with []
    end
  end
end
