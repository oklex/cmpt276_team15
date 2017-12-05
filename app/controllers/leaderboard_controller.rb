class LeaderboardController <ApplicationController
  def index
    @users =User.all.order("total_points DESC, enemies_killed ASC").limit(10)
  end
end
