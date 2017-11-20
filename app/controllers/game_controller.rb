class GameController <ApplicationController
  def index
    render file: Rails.public_path.join("unitygame", "index.html"), layout: false
  end
end
