module V1
  class ChapterPreviewsController < ApiController
    def create
      render json: {
        safe_text: Renderer.call(preview_params[:text])
      }
    end

    private

    def preview_params
      params.require(:chapter).permit(:title, :text)
    end
  end
end
