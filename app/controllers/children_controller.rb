class ChildrenController < ApplicationController
  before_action :set_parent
  before_action :set_child, only: [:edit, :update, :destroy]


  def new
    @child = @parent.children.build
  end

  def create
    @child = @parent.children.build(child_params)

    if @child.save
      respond_to do |format|
        format.html { redirect_to parent_path(@parent), notice: "#{@child.name} was successfully created." }
        format.turbo_stream { flash.now[:notice] = "#{@child.name} was successfully created." }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @child.update(child_params)
      respond_to do |format|
        format.html { redirect_to parent_path(@parent), notice: "#{@child.name} was successfully updated." }
        format.turbo_stream { flash.now[:notice] = "#{@child.name} was successfully updated." }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @child.destroy

    respond_to do |format|
      format.html { redirect_to parent_path(@parent), notice: "#{@child.name} was successfully destroyed." }
      format.turbo_stream { flash.now[:notice] = "#{@child.name} was successfully destroyed." }
    end
  end

  private

  def set_parent
    @parent = Parent.find(params[:parent_id])
  end

  def set_child
    @child = @parent.children.find(params[:id])
  end

  def child_params
    params.require(:child).permit(:name, :date_of_birth)
  end
end
