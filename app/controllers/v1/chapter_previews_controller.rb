class ChapterPreviewsController < ApiController
  def create
    render json: {
      safe_text: Renderer.call(params[:raw_text])
    }
  end

  private

  def preview_params
    params.require(:raw_text)
  end
end
