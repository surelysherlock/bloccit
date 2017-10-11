class SponsoredPostsController < ApplicationController
  def show
    @sponsoredpost = SponsoredPost.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @sponsoredpost = SponsoredPost.new 
  end

  def create 
    puts "PARAMS ARE HERE BRAH"
    puts params
    @sponsoredpost = SponsoredPost.new
    @sponsoredpost.title = params[:sponsored_post][:title]
    @sponsoredpost.body = params[:sponsored_post][:body]
    @sponsoredpost.price = params[:sponsored_post][:price]
    @topic = Topic.find(params[:topic_id])

    @sponsoredpost.topic = @topic
    
    if @sponsoredpost.save
      flash[:notice] = "Sponsored Post was saved."
      redirect_to [@topic, @sponsoredpost]
    else
      flash.now[:alert] = "There was an error saving the sponsored post. Please try again."
      render :new
    end
  end

  def edit
    @sponsoredpost = SponsoredPost.find(params[:id])
  end
end
