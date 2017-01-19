class LineItemsController < ApplicationController
  def create
    @job = Job.find(params[:job_id])
    @line_item = @job.line_items.build(line_item_params)

    if @line_item.save
      flash[:notice] = "Line item was successfully."
      redirect_to :back
    else
      flash[:notice] = "There was an error saving the line item."
      render :new
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
      render :new
    end
  end

  private

  def line_item_params
    params.require(:line_item).permit(:type)
  end
end
