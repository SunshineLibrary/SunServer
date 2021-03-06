class ApplicationController < ActionController::Base
  protect_from_forgery

  # before_filter :verify_identity_for_new_del,  :only => [:new, :create, :destroy]
  # before_filter :verify_identity_for_edit, :only => [:edit,:update]
  # before_filter :verify_identity_for_view, :only => [:index, :show]

  before_filter :admin_signed_in_required

  private
  def admin_signed_in_required
    if not admin_signed_in?
      unless params[:controller] == 'devise/sessions' or params[:controller] == 'devise/registrations'
        redirect_to new_admin_session_path
      end
    end
  end

  def get_user_from_token
    if params[:access_token] and (@access_token = MachineSignin.find_user_by_access_token params[:access_token])
      @access_token.user
    else
      nil
    end
  end

  #require 'books_controller'
  #require 'tags_controller'
  #require 'subjects_controller'
  #require 'providers_controller'
  #require 'authors_controller'
  #require 'lessons_controller'

  # private
  # def verify_identity_for_new_del
    # #@need_admin_auth = [SubjectsController, BooksController, TagsController, AuthorsController, ProvidersController, LessonsController]
    # @need_admin_auth = []
    # @need_user_auth = []
#
    # verify_identity
  # end
#
  # private
  # def verify_identity_for_edit
    # @need_admin_auth = []
    # @need_user_auth = []
# #    @need_user_auth = [SubjectsController, BooksController, TagsController, AuthorsController, ProvidersController, LessonsController]
#
    # verify_identity
  # end
#
  # private
  # def verify_identity_for_view
    # @need_admin_auth = []
    # @need_user_auth = []
  # end
#
  # private
  # def verify_identity
    # @need_admin_auth.each do |admin_auth_class|
      # authenticate_admin! if self.instance_of? admin_auth_class
    # end
#
    # #make admin super than user.
    # unless admin_signed_in?
      # @need_user_auth.each do |user_auth_class|
        # authenticate_user! if self.instance_of? user_auth_class
      # end
    # end
  # end
end
