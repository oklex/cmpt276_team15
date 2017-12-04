class LeaderboardController <ApplicationController
  def index
    @users =User.all.order("total_points DESC, name ASC").limit(10)
  end
end
