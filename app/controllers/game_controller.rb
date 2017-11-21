class GameController <ApplicationController
  before_action :authenticate_user, :only => [:index]

  def index
    redirect_to 'https://tyre-double-l.itch.io/bender-v1'
  end
end
