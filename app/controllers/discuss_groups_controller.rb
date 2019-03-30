class DiscussGroupsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destory, :join, :quit]
  before_action :find_group_and_check_permission, only: [:edit, :update, :destory]

  def index
    @discuss_groups = DiscussGroup.all
  end

  def new
    @discuss_group = DiscussGroup.new
  end

  def create
    @discuss_group = DiscussGroup.new(discuss_group_params)
    @discuss_group.user = current_user
    if @discuss_group.save
    	current_user.join!(@discuss_group)
      redirect_to discuss_groups_path, notice: "新增成功"
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @discuss_group.update(discuss_group_params)
      redirect_to discuss_groups_path, notice: "Update success"
    else
      render :edit
    end
  end

  def show
    @discuss_group = DiscussGroup.find(params[:id])
    @posts = @discuss_group.posts.recent.paginate(page: params[:page], per_page: 5)
  end

  def destroy
    @discuss_group.destroy
    redirect_to discuss_groups_path, notice: "Delete success"
  end


  def join()
  	discuss_group = DiscussGroup.find(params[:id])
    if !current_user.is_member_of?(discuss_group)
      current_user.join!(discuss_group)
      flash[:notice] = "加入本討論版成功"
    else
      flash[:warning] = "你已經是本討論版的成員了!"
    end
    redirect_to discuss_group_path(discuss_group)
  end

  def quit()
  	discuss_group = DiscussGroup.find(params[:id])
    if current_user.is_member_of?(discuss_group)
      current_user.quit!(discuss_group)
      flash[:alert] = "已退出本討論版"
    else
      flash[:warning] = "你不是本討論版成員，怎麼退出?"
    end
    redirect_to discuss_group_path(discuss_group)
  end


  private
  def discuss_group_params
    params.require(:discuss_group).permit(:title, :description)
  end

  def find_group_and_check_permission
    @discuss_group = DiscussGroup.find(params[:id])
    if current_user != @discuss_group.user
      redirect_to discuss_groups_path, alert: "You have no permission"
    end
  end



end
