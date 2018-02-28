#encoding: utf-8
class Discustom::SessionsController < Devise::SessionsController
  before_filter :configure_sign_in_params, only: [:create]
  layout "nobar"
  after_filter :set_csrf_headers, only: [:create]


  # GET /resource/sign_in
   def new
     if params[:username]
       @resource = User.new(sign_in_params)
       @resource_name = devise_mapping.name
       respond_to do |format|
         format.js
       end
     else
       super
     end
   end

  # POST /resource/sign_in
   def create
     respond_to do |format|
       format.html{ 
         devise_parameter_sanitizer.permit(:sign_in) #<< :attribute
         super 
       }
       format.js do
         if signed_in_resource
           resource = warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
           scope = Devise::Mapping.find_scope!(resource_name)
           resource ||= resource_name
           sign_in(scope, resource) unless warden.user(scope) == resource
         else
           render :js => "alert('验证失败!')"
         end
       end
     end
   end

  # DELETE /resource/sign_out
   def destroy
    respond_to do |format|
      format.html{ super }
      format.json do
        redirect_path = after_sign_out_path_for(resource_name)
        signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
        render :json => {:code => code, :redirect => redirect_path}
      end
      format.js do
        @user = current_user
        redirect_path = after_sign_out_path_for(resource_name)
        signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
      end
    end
   end

   protected

  # You can put the params you want to permit in the empty array.
   def configure_sign_in_params
   end
  def set_csrf_headers
    cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?  
  end
end
