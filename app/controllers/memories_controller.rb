class MemoriesController < ApplicationController

  def index
    if params[:child_id]
      @memories = Child.find(params[:child_id]).memories
    else
    @memories = Memory.all
    end
  end

  def show
    @memory = Memory.find_by(params[:id])
  end

  def new
    @child = Child.find(params[:child_id])
    @memory = @child.memories.build
  end

  def create
    @memory = Memory.new(memory_params)
      if @memory.save
        redirect_to @memory
      else
        render :new
      end
  end

  def edit
    @memory = Memory.find_by(params[:id])
  end

  def update
    if @memory.update(memory_params)
      redirect_to @memory
    else
      render :edit
    end
  end

  private

  def memory_params
    params.require(:memory).permit(:title, :content, :child_id, :user_id, categories_attributes:[:name])
  end
end
