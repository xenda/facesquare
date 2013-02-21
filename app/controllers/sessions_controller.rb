class SessionsController < ApplicationController

  def create
    logger.info request.env["omniauth.auth"]
    session["current_user"] = request.env["omniauth.auth"]["uid"]
    # uid       = request.env["omniauth.auth"]["uid"]
    # provider  = request.env["omniauth.auth"]["provider"] 
    # user = User.find_or_create_by_uid_and_provider(uid, provider)
    # session["current_user"] = user.id
    session["name"]  = request.env["omniauth.auth"]["info"]["name"]
    session["image"] = request.env["omniauth.auth"]["info"]["image"]
    redirect_to root_path
  end



  def destroy
    session["current_user"] = nil
    redirect_to root_path
  end


  #   BROWSER   ---->    |   SERVIDOR WEB --> RACK ------| --| ----|---> RAILS
  #                        -> GET /sdfd?a=1    -> {a: 1}  ----------->   params[:a]

end