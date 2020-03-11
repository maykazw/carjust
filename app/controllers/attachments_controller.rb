class AttachmentsController < ApplicationController
  before_action :load_attachment, only: [:destroy]

  def create
    attachment = Attachment.create!(attachment_params)
    render json: attachment,:serializer => AttachmentSerializer
  end

  def destroy
    @attachment.destroy
    render json: {success: true}
  end

  protected

  def attachment_params
    params.require(:file)
    params.permit(:file)
  end

  def load_attachment
    @attachment = Attachment.find(params[:id])
  end
end

