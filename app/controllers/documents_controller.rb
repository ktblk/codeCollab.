class DocumentsController < ApplicationController
  before_action :authorize

  def index
    @notifications_cu = Notification.where(person_to_notify: current_user)
    @users_sign_in = User.where("status = ? AND id != ?", true, current_user)
    if session[:user_id].nil?
        redirect_to login_path
    else
      @documents = current_user.documents
    end
  end




  def create
    @document = current_user.documents.build(document_params)
    respond_to do |format|
      if @document.save
        format.html { redirect_to users_documents_path }
        format.json { render :show, status: :created, location: @document }
      else
        format.html { render :new }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @document = Document.find(params[:id])
    if @document.update_attributes(document_params)
      render :json => :success
    end
  end

  def destroy
    @document = Document.find(params[:id])
    @document.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { head :no_content }
    end
  end

  def retreiver
    response = Document.find(params[:file_id])
    render plain: response.file

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document
      @document = Document.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def document_params
      params.require(:document).permit(:file)
    end
end
