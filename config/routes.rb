Rails.application.routes.draw do
  
  get("/flexible/square/:user_number",{:controller => "calculations",:action => "flex_square"})
  get("/flexible/square_root/:user_number",{:controller => "calculations",:action => "flex_square_root"})
  get("/flexible/random/:range_1/:range_2",{:controller => "calculations",:action => "flex_random"})
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount WebGit::Engine, at: "/rails/git"
end
