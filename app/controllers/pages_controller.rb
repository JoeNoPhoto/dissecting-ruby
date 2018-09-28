class PagesController < ApplicationController
  def home
    @posts = Blog.all
    @skills = Skill.all
  end

  def about
  end

  def contact
  end

  def nfl_news
    @tweets = SocialTool.twitter_search
  end
end
