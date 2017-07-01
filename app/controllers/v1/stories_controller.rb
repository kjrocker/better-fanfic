module V1
  class StoriesController < ApiController
    before_action :set_story, except: [:index, :create]
    before_action :authenticate_user, only: [:create, :update, :destroy]
    before_action :authorize_user, only: [:update, :destroy]

    def index
      @stories = Story.all
      render json: @stories
    end

    def create
      story = Story.new(story_params.merge(user: current_user))
      if story.save
        render json: {}, status: :created
      else
        render json: story.errors, status: :unauthorized
      end
    end

    def update
      if @story.update(story_params)
        render json: @story, status: 200
      else
        render json: @story.errors, status: :unprocessable_entity
      end
    end

    def show
      render json: @story
    end

    def destroy
      @story.destroy
    end

    private

    def set_story
      @story = Story.find(params[:id])
    end

    def authorize_user
      render json: {}, status: :forbidden unless current_user == @story.user
    end

    def story_params
      params.require(:story).permit(:title, :summary)
    end
  end
end
