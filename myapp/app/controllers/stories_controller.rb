class StoriesController < ApplicationController
  
  def index
  	@story = Story.select(:id ,:name , :description , :isposted, :link )
   end
  
  def new 
  	@story = Story.new() 	  	
   end
  
  def create
  	@story = Story.new(story_params)
  	@story.save
  	redirect_to story_path(@story.id)
   end
  
  def show
    @story = Story.find(params[:id])
   end


  def destroy
    Story.find(params[:id]).destroy
    redirect_to stories_index_url
  end
  
  def edit
  	@story = Story.find(params[:id])
  	end
  
  def update
  	Story.find(params[:id]).update(story_params)
  	redirect_to Story
  end

  def story_params
     params.require(:story).permit(:name , :description, :link, :isposted, :id)
  end

end