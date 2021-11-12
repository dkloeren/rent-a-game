class ConsolesController < ApplicationController

  before_action :set_console, only: %i[destroy]

  def index
    @consoles = Console.all
    @console = Console.new
  end

  def create
    @console = Console.new(params_index)
    if @console.save
      redirect_to consoles_path
    else
      @consoles = Console.all
      render :index
    end
  end

  def destroy
    @console.destroy
    redirect_to consoles_path
  end

  private

  def set_console
    @console = Console.find(paramsp[:id])
  end

  def params_index
    params.require(:console).permit(:name, :short, :image)
  end
end
