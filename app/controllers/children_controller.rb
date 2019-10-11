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

  def edit
    @child = Child.find(params[:id])
  end

  def update
    @child = Child.find(params[:id])
    if @child.update(child_params)
      redirect_to @child
    else
      render :edit
    end
  end

  def destroy
    @child = Child.find(params[:id])
    @child.destroy
    redirect_to children_url
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
