class Admin::UsersController < Admin::AdminController

  def index
    @users = User.all.page(params[:page])
  end
end
