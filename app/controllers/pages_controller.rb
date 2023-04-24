class PagesController < ApplicationController
  def home
    @user_check = User.count < 1
  end

  def about
    @skills = Skill.all
  end

  def contact
  end

  
  def tech_news
    @tweets = SocialTool.twitter_search
  end
end
