module SessionsHelper
  
  def sign_in(user)
    cookies.permanent.signed[:remember_token] = [user.id, user.salt]
    current_user = user
  end
  
  def current_user=(user)
    @current_user = user
  end
  
  def current_user
    @current_user ||= user_from_remember_token
  end
  
  def current_user?(user)
    user == current_user
  end
  
  def signed_in?
    !current_user.nil?
  end
  
  def sign_out
    cookies.delete(:remember_token)
    self.current_user = nil
  end
  
  def authenticate
    deny_access unless signed_in?
  end
  
  def deny_access
    store_location
    redirect_to signin_path, :notice => "Please sign in to access this page"
  end
  
  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    clear_return_to
  end

  def make_forgot_pw(user)
    encrypt_forgot_password(user)
  end
  
  private
      
      def user_from_remember_token
        User.authenticate_with_salt(*remember_token)
      end
      
      def remember_token
        cookies.signed[:remember_token] || [nil, nil]
      end
      
      def store_location
        session[:return_to] = request.fullpath
      end
      
      def clear_return_to
        session[:return_to] = nil
      end

      def correct_user
        @user = User.find_by_username(params[:id])
        redirect_to(root_path) unless current_user?(@user)
      end
      
      def adminuser
        redirect_to(root_path) unless current_user.admin?
      end

      def superuser
        redirect_to(root_path) unless current_user.super_user?
      end

      def admin_user
        current_user.admin?
      end

      def super_user
        current_user.super_user?
      end

      def same_user_id
        user = User.find_by_user_id(params[:id])
        current_user?(user)
      end

      def encrypt_forgot_password(user)
        user.forgot_pw = make_forgot_password(user.email)
      end
      
      def make_forgot_password(email)
        secure_hash_forgot("#{Time.now.utc}--#{email}")
      end
      
      def secure_hash_forgot(string)
        Digest::SHA2.hexdigest(string)
      end
  
end
