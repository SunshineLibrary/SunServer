class ApplicationController < ActionController::Base
  protect_from_forgery
 
  # before_filter :verify_identity_for_new_del,  :only => [:new, :create, :destroy]
  # before_filter :verify_identity_for_edit, :only => [:edit,:update]
  # before_filter :verify_identity_for_view, :only => [:index, :show] 
  
  before_filter :admin_signed_in_required
  
  require 'books_controller'
  require 'tags_controller'
  require 'subjects_controller'
  require 'providers_controller'
  require 'authors_controller'
  require 'lessons_controller'  
  
  private
  def admin_signed_in_required
    unless admin_signed_in? || params[:controller] == 'devise/sessions'
      redirect_to new_admin_session_path
    end
  end
    
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
