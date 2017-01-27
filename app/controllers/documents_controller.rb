class DocumentsController < ApplicationController
  def index
    @documents = Document.all
  end

  def show
    @document = Document.find(params[:id])
  end

  def create
    @document = Document.new(document_params)

    if @document.save
      flash[:notice] = "Document was successfully."
      redirect_to :back
    else
      flash[:alert] = "There was an error saving the document."
      redirect_to :back
    end
  end

  def update
    @document = Document.find(params[:id])
    @document.assign_attributes(document_params)

    if @document.save
      flash[:notice] = "Document was successfully."
      redirect_to :back
    else
      flash[:alert] = "There was an error saving the document"
      redirect_to :back
    end
  end

  def destroy
    @document = Document.find(params[:id])

    if @document.destroy
      flash[:notice] = "This document was deleted successfully."
      render :index
    else
      flash[:alert] = "Document couldn't be deleted. Try again."
      redirect_to :back
    end
  end

  private
  def document_params
    params.require(:document).permit(:name)
  end
end
