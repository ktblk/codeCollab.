class WorkspacesController < ApplicationController
  def index
  end

  def create

  end

  def destroy
    @workspace.destroy
      respond_to do |format|
        format.html { redirect_to documents_url }
        format.json { head :no_content }
      end
  end

  def edit
  end

  def workspace
    
  end

end
