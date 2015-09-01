class StoriesController < ApplicationController

  before_action :set_story, only: [:show, :update, :destroy, :edit]

  def index
    @story = Story.all
  end

  def new
    @story = Story.new
  end

  def create
    @story = Story.new(story_params)
    if @story.save
      redirect_to story_path(@story.id), notice: 'Story Added Successfully'
    else
      render :action => 'new', alert: "Failed to Create Story"
    end
  end

  def show
  end

  def destroy
    @story.destroy
    flash[:error] = 'Story Deleted Successfully'
    redirect_to stories_path
  end


  def edit
  end

  def update
    @story.update(story_params)
    redirect_to Story , notice: "Story Information updated Successfully"
  end

  private
    def set_story
      @story = Story.find(params[:id])
    end
    def story_params
      params.require(:story).permit(:name, :description, :link, :isposted, :id)
    end

end