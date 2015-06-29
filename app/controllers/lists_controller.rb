class ListsController < ApplicationController
  before_filter :find_user

  def index
    @lists = @user.lists
  end

  def new
    @list = @user.lists.new
  end

  def create
    @list = @user.lists.new list_params
    if @user.save
      redirect_to user_lists_path(@user), notice: 'Congratulation! You have added a new list.'
    else
      render 'new'
    end
  end

  private

  def find_user
    @user = current_user
  end

  def list_params
    params.require(:list).permit(:name)
  end

end