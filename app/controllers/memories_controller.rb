class MemoriesController < ApplicationController

  def index
    @memories = Memory.all
  end

  def show
    @memory = Memory.find_by(params[:id])
  end

  def new
    @memory = Memory.new
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
    params.require(:memory).permit(:title, :content)
  end
end
