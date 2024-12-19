class ParentsController < ApplicationController
    before_action :set_parent, only: [:show, :edit, :update, :destroy]

  def index
    @parents = Parent.ordered
  end

  def show
    @children = @parent.children.includes(:visits).ordered
  end

  def new
    @parent = Parent.new
  end

  def create
    @parent = Parent.new(parent_params)

    if @parent.save
      respond_to do |format|
        format.html { redirect_to parents_path, notice: "#{@parent.name} was successfully created." }
        format.turbo_stream { flash.now[:notice] = "#{@parent.name} was successfully created." }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @parent.update(parent_params)
      respond_to do |format|
        format.html { redirect_to parents_path, notice: "#{@parent.name} was successfully updated." }
        format.turbo_stream { flash.now[:notice] = "#{@parent.name} was successfully updated." }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @parent.destroy
    respond_to do |format|
      format.html { redirect_to parents_path, notice: "#{@parent.name} was successfully destroyed." }
      format.turbo_stream { flash.now[:notice] = "#{@parent.name} was successfully destroyed." }
    end
  end


  private

  def set_parent
    @parent = Parent.find(params[:id])
  end

  def parent_params
    params.require(:parent).permit(:name)
  end
end
