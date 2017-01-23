class LineItemsController < ApplicationController
  def create
    @job = Job.find(params[:job_id])
    @line_item = @job.line_items.build(line_item_params)

    if @line_item.save
      flash[:notice] = "Line item was successfully."
      redirect_to :back
    else
      flash[:notice] = "There was an error saving the line item."
      redirect_to :back
    end
  end

  def update
    @line_item = LineItem.find(params[:id])
    @line_item.assign_attributes(line_item_params)

    if @line_item.save
      flash[:notice] = "Line item was successfully."
      redirect_to :back
    else
      flash[:notice] = "There was an error saving the line item."
      render :back
    end
  end

  def destroy
    @job = Job.find(params[:job_id])
    @line_item = @job.line_items.find(params[:id])

    if @line_item.destroy
      flash[:notice] = "This line item was deleted successfully."
    else
      flash[:alert] = "Line item couldn't be deleted. Try again."
    end
  end

  private
  def line_item_params
    params.require(:line_item).permit(:type, :quantity, :fee, :itemizable_id)
  end
end
