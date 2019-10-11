class MemoriesController < ApplicationController

  def index
    if params[:child_id]
      @memories = Child.find(params[:child_id]).memories
    else
    @memories = Memory.all
    end
  end

  def show
    @memory = Memory.find(params[:id])
    
  end

  def new
    @child = Child.find(params[:child_id])
    @memory = @child.memories.build
    @category = Category.new
    @memory.category = @category
  end

  def create
    @child = Child.find(params[:child_id])
    @memory = current_user.memories.build(memory_params)
      if @memory.save
        redirect_to child_memory_path(@child, @memory)
      else
        render :new
      end
  end

  def edit
    @memory = Memory.find(params[:id])
    @child = @memory.child
  end

  def update
    if @memory.update(memory_params)
      redirect_to @memory
    else
      render :edit
    end
  end

  def destroy
    @memory = Memory.find(params[:id])
    @memory.destroy
    redirect_to child_url
  end

  private

  def memory_params
    params.require(:memory).permit(:title, :content, :child_id, :user_id, category_attributes:[:name])
  end
end
