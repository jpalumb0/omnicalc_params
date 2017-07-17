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
    
    def flex_payment
        @apr = params[:interest_rate].to_f
        @years = params[:term_years].to_i
        @principal = params[:principal].to_f
        
        @apr = @apr/100
        @apr = @apr.round(2)
        
        @monthly_payment = @principal *( ((@apr / 100 / 12) * ( 1 + (@apr / 100 / 12))**(@years * 12))  / ( ( 1 + (@apr / 100 / 12) )**(@years * 12) - 1) )
     
        
    render("/calculations/flexible_payment_template.html.erb")
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
    
    def square_form
        
        
        render("/calculations/square_form_template.html.erb")
    end
    
    def process_square
       
        @user_number = params["the_user_number"].to_f
        @squared_number = @user_number**2
       
       render("/calculations/square_results_template.html.erb") 
    end
    
    def square_root_form
        
        
        render("/calculations/square_root_form_template.html.erb")
    end
    
    def process_square_root
       
        @user_number = params["the_user_number"].to_f
        @square_root_number = @user_number**0.5
       
       render("/calculations/square_root_results_template.html.erb") 
    end
    
    def payment_form
       
       render("/calculations/payment_form_template.html.erb") 
    end
    
    def process_payment
        
        @apr = params["user_APR"].to_f
        @years = params["user_term"].to_i
        @principal = params["user_principal"].to_f
        
        
        @monthly_payment = @principal *( ((@apr / 100 / 12) * ( 1 + (@apr / 100 / 12))**(@years * 12))  / ( ( 1 + (@apr / 100 / 12) )**(@years * 12) - 1) )
     
        render("/calculations/payment_results_template.html.erb")
    end   
    
    def random_form
       
       render("/calculations/random_form_template.html.erb") 
    end
    
    def process_random
        # The incoming parameters for this action look like {"user_number" => "bob"}
        # Rails stores that hash in a variable called params
        
        user_range = [params["user_min"].to_f,params["user_max"].to_f]
        sorted_user_range = user_range.sort
        @lo = sorted_user_range[0]
        @hi = sorted_user_range[1]
        @random_number = rand(@lo..@hi)
        
        render("/calculations/random_results_template.html.erb")
    end
end
