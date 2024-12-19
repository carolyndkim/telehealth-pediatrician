class PhysiciansController < ApplicationController
    before_action :set_physician, only: [:show, :edit, :update, :destroy]

  def index
    @physicians = Physician.ordered
  end

  def show
    @visits = @physician.visits.includes(:parent,:child).ordered
  end

  def new
    @physician = Physician.new
  end

  def create
    @physician = Physician.new(physician_params)

    if @physician.save
      respond_to do |format|
        format.html { redirect_to physicians_path, notice: "#{@physician.name} was successfully created." }
        format.turbo_stream { flash.now[:notice] = "#{@physician.name} was successfully created." }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @physician.update(physician_params)
      respond_to do |format|
        format.html { redirect_to physicians_path, notice: "#{@physician.name} was successfully updated." }
        format.turbo_stream { flash.now[:notice] = "#{@physician.name} was successfully updated." }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @physician.destroy
    respond_to do |format|
      format.html { redirect_to physicians_path, notice: "#{@physician.name} was successfully destroyed." }
      format.turbo_stream { flash.now[:notice] = "#{@physician.name} was successfully destroyed." }
    end
  end


  private

  def set_physician
    @physician = Physician.find(params[:id])
  end

  def physician_params
    params.require(:physician).permit(:name)
  end
end
