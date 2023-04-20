class TopicsController < ApplicationController
  before_action :set_sidebar_topics
  layout "blog"

  def index
    @topics = Topic.all
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)

    respond_to do |format|
      if @topic.save
        format.html { redirect_to topics_path, notice: "Topic was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def show
    @topic = Topic.find(params[:id])
    
    if logged_in?(:site_admin)
      @blogs = @topic.blogs.recent.page(params[:page]).per(5)
    else
      @blogs = @topic.blogs.published.recent.page(params[:page]).per(5)
    end
  end

  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy

    respond_to do |format|
      format.html { redirect_to topics_path, notice: "Blog was successfully destroyed." }
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:title)
  end

  def set_sidebar_topics
    @side_bar_topics = Topic.with_blogs
  end
end
