class VisitsController < ApplicationController
    before_action :set_parent
    before_action :set_child
    before_action :set_visit, only: [:edit, :update, :destroy]

  
    def new
      @visit = @child.visits.build
    end
  
    def create
      @visit = @child.visits.build(visit_params)
      @visit.parent = @parent
  
      if @visit.save
        respond_to do |format|
          format.html { redirect_to parent_path(@parent), notice: "Visit request was successfully created." }
          format.turbo_stream { flash.now[:notice] = "Visit request was successfully created." }
        end
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
    end
  
    def update
      if @visit.update(visit_params)
        respond_to do |format|
          format.html { redirect_to parent_path(@parent), notice: "Visit request was successfully updated." }
          format.turbo_stream { flash.now[:notice] = "Visit request was successfully updated." }
        end
      else
        render :edit, status: :unprocessable_entity
      end
    end
    
    def destroy
        @visit.destroy

        respond_to do |format|
          format.html { redirect_to parent_path(@parent), notice: "Visit request was successfully cancelled." }
          format.turbo_stream { flash.now[:notice] = "Visit request was successfully cancelled." }
        end
      end
  
    private
  
    def visit_params
      params.require(:visit).permit(:symptoms)
    end
  
    def set_parent
      @parent = Parent.find(params[:parent_id])
    end
  
    def set_child
      @child = @parent.children.find(params[:child_id])
    end

    def set_visit
        @visit = @child.visits.find(params[:id])
    end
  end