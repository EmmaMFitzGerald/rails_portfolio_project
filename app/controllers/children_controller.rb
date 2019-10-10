class ChildrenController < ApplicationController
  def index
    @children = Child.all
  end

  def show
    @child = Child.find(params[:id])
  end

  def new
    @child = Child.new
    memory = @child.memories.build
    category = Category.new
    memory.category = category
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
        :user_id,
        category_attributes:[:name]
    ])
  end
end
