class CalculationsController < ApplicationController
    def flex_square
        # The incoming parameters for this action look like {"user_number" => "bob"}
        # Rails stores that hash in a variable called params
        
        @user_number = params["user_number"].to_i
        @squared_number = @user_number**2
        
        render("/calculations/flexible_square_template.html.erb")
    end
    
    def flex_square_root
        # The incoming parameters for this action look like {"user_number" => "bob"}
        # Rails stores that hash in a variable called params
        
        @user_number = params["user_number"].to_i
        @square_root_number = @user_number**0.5
        
        render("/calculations/flexible_square_root_template.html.erb")
    end
    
    def flex_random
        # The incoming parameters for this action look like {"user_number" => "bob"}
        # Rails stores that hash in a variable called params
        
        user_range = [params["range_1"].to_i,params["range_2"].to_i]
        sorted_user_range = user_range.sort
        @lo = sorted_user_range[0]
        @hi = sorted_user_range[1]
        @random_number = rand(@lo..@hi)
        
        render("/calculations/flexible_random_template.html.erb")
    end
end