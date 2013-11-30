class User::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    if user_signed_in?
      existent = User.find(:all, :conditions => { :provider => request.env["omniauth.auth"]['provider'].to_s, :uid => request.env["omniauth.auth"]['uid'].to_s })
      if existent.count >= 1
        existent.each do |user|
          @mailExistent = user.email
        end
        redirect_to '/', :flash => {:error => "Exista deja un utilizator conectat cu acest cont de fb (email - %s)" % @mailExistent} and return
      end
      @test = User.find_by email: current_user.email
      @test.provider = request.env["omniauth.auth"]['provider'].to_s
      @test.uid = request.env["omniauth.auth"]['uid'].to_s
      @test.save
      redirect_to '/'
    else
    @user = User.find_for_facebook_oauth(request.env["omniauth.auth"], current_user)

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
    end
  end
end