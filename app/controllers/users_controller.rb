class UsersController < ApplicationController
  before_action :authenticate
  before_action :authorize_teacher
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
  end

  # GET /users/1
  # GET /users/1.json
  def show
    redirect_to edit_user_path(params)
  end

  # GET /users/new
  def new
    @type = params[:type]
    @user = User.new(role_id: Role.find_by_name(@type).id)
    @group = @type.constantize.new
  end

  # GET /users/1/edit
  def edit
    @type = params[:type]
    @group = @type.constantize.find_by(user_id: params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.create_user(email: user_params[:email],
          password: user_params[:password],
          type: params[:type],
          user_hash: user_params[params[:type].downcase])

    if @user.save
      redirect_to teacher_index_path, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    if @user.update_user?(email: user_params[:email], user_hash: user_params[params[:type].downcase])
      redirect_to teacher_index_path, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    redirect_to teacher_index_path, notice: 'User was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password, :role_id, teacher: [:first_name, :last_name], student: [:first_name, :last_name, :teacher_id], parent: [:first_name, :last_name, :student_id])
    end
end
