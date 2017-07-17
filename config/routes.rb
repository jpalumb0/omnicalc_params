Rails.application.routes.draw do
  
  get("/flexible/square/:user_number",{:controller => "calculations",:action => "flex_square"})
  get("/flexible/square_root/:user_number",{:controller => "calculations",:action => "flex_square_root"})
  get("/flexible/payment/:interest_rate/:term_years/:principal",{:controller => "calculations",:action => "flex_payment"})
  get("/flexible/random/:range_1/:range_2",{:controller => "calculations",:action => "flex_random"})
  
  get("/square/new",{:controller => "calculations",:action => "square_form"})
  get("/square/results",{:controller => "calculations",:action => "process_square"})
  
  get("/square_root/new",{:controller => "calculations",:action => "square_root_form"})
  get("/square_root/results",{:controller => "calculations",:action => "process_square_root"})
  
  get("/payment/new", {:controller => "calculations", :action => "payment_form"})
  get("/payment/results", {:controller => "calculations", :action => "process_payment"})
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount WebGit::Engine, at: "/rails/git"
end
