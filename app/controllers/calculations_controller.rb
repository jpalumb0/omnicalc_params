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
    
    def word_count_form
       
       render("/calculations/word_count_form_template.html.erb") 
    end
    
    def process_word_count
    
        @text = params["user_text"]
        @special_word = params["user_special"]

        @word_count = @text.split.count

        @character_count_with_spaces = @text.length

        @character_count_without_spaces = @text.gsub(/\s+/,"").length

        @occurrences = @text.gsub(/[^a-z0-9\s]/i,"").downcase.split.count(@special_word.downcase) #downcase necessary?
        
        render("/calculations/word_count_results_template.html.erb")
    end
    
    def stats_form
       
       render("/calculations/stats_form_template.html.erb") 
    end
    
    def process_stats
        @numbers = params[:list_of_numbers].gsub(',', '').split.map(&:to_f)

        @sorted_numbers = @numbers.sort
    
        @count = @numbers.count

        @minimum = @numbers.min
    
        @maximum = @numbers.max
    
        @range = @maximum-@minimum
    
        if @count.odd?
          @median = @sorted_numbers[@count/2]
        else
          a=@sorted_numbers[@count/2]
          b=@sorted_numbers[(@count/2)-1]
          @median = (a+b)/2
        end
    
        @sum = @numbers.sum
    
        @mean = @sum/@count
        
        nums = @numbers
        vars = []
        nums.each do |num|
          var = ((num-@mean)**2)
          vars.push(var)
        end
        @variance = vars.sum/@count
    
        @standard_deviation = @variance**0.5
    
       # @mode = @numbers.max_by{|i|@numbers.count(i)}
        
        occurrences = []
        @numbers.each do |i|
          occurrences.push(@numbers.count(i))
        end  
        
        @mode = @numbers[occurrences.index(occurrences.max)]
    
        
        render("/calculations/stats_results_template.html.erb")
    end
    
    def landing
       
       render("/calculations/landing_template.html.erb") 
    end
end
