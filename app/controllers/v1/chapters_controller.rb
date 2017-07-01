module V1
  class ChaptersController < ApiController
    before_action :set_chapter, except: [:index, :create]
    before_action :set_story, only: [:index, :create]
    before_action :authenticate_user, only: [:create, :update, :destroy]
    before_action :authorize_user, only: [:update, :destroy]

    def index
      @chapters = @story.chapters
      render json: @chapters
    end

    def create
      chapter = Chapter.new(chapter_params.merge(user: current_user, story: @story))
      if chapter.save
        render json: {}, status: :created
      else
        render json: chapter.errors, status: :unauthorized
      end
    end

    def update
      if @chapter.update(chapter_params)
        render json: @chapter, status: 200
      else
        render json: @chapter.errors, status: :unprocessable_entity
      end
    end

    def show
      render json: @chapter
    end

    def destroy
      @chapter.destroy
    end

    private

    def set_chapter
      @chapter = Chapter.find(params[:id])
    end

    def set_story
      @story = Story.find(params[:story_id])
    end

    def authorize_user
      render json: {}, status: :forbidden unless current_user == @chapter.user
    end

    def chapter_params
      params.require(:chapter).permit(:title, :raw_text)
    end
  end
end
