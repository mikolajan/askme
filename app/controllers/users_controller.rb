class UsersController < ApplicationController
  before_action :load_user, except: [:index, :create, :new]
  before_action :authorize_user, except: [:index, :create, :new, :show]

  def index
    @users = User.all
  end

  def new
    redirect_to root_path, alert: 'Вы уже в системе' if current_user.present?

    @user = User.new
  end

  def create
    redirect_to root_path, alert: 'Вы уже в системе' if current_user.present?

    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id

      redirect_to root_path, notice: 'Вы успешно зарегистрированы!'
    else
      render :new
    end
  end

  def destroy
    @user.destroy!

    redirect_to root_path, notice: 'Пользователь удален!'
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: 'Данные обновлены'
    else
      render :edit
    end
  end

  def show
    @questions = @user.questions.order(created_at: :desc)

    @new_question = @user.questions.build

    @questions_count = @questions.count
    @unanswered_count = @questions.where(answer: nil).count
    @answers_count = @questions_count - @unanswered_count
  end

  private

  def authorize_user
    reject_user unless @user == current_user
  end

  def load_user
    @user ||= User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation,
                                 :name, :username, :avatar_path, :color)
  end
end
