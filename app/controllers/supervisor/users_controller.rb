class Supervisor::UsersController < SupervisorController
  before_action :load_user, only: :destroy

  def index
    @users = User.sorted
                 .paginate(page: params[:page], per_page: Settings.per_page)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.role = User.roles[:trainee]
    @user.password = Settings.password
    @user.password_confirmation = Settings.password
    if @user.save
      flash[:success] = t(:done)
      redirect_to supervisor_users_path
    else
      render :new
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = t("delete", resource: User.name)
    else
      flash[:danger] = t(:wrong_msg)
    end
    redirect_to admin_users_path
  end

  private

  def load_user
    @user = User.find_by id: params[:id]
    return if @user
    render plain: t(:user_not_found)
  end

  def user_params
    params.require(:user).permit(:email, :name)
  end
end
