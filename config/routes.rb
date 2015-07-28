Rails.application.routes.draw do
  # This route is for the bare domain. You can ignore it.
  get("/", { :controller => "game", :action => "home" })

  # Your code goes below.

  get("/play/:user_move", { :controller => "game", :action => "play" })

end
