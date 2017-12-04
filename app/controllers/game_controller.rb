class GameController <ApplicationController
  before_action :authenticate_user, :only => [:index]

  def index
  end

  def leaderboard
  end
  
end
