class ChildrenController < ApplicationController
  def index
    @children = Child.all
  end

  def show
    @child = Child.find(params[:id])
  end

  def new
    @child = Child.new
    @child.memories.build
  end

  def create
    @child = current_user.children.build(child_params)
    if @child.save
      redirect_to @child
    else
      render :new
    end
  end
\

  private

  def child_params
    params.require(:child).permit(:name, :birthday, memories_attributes: [
        :title,
        :content,
        :user_id
    ])
  end
end
