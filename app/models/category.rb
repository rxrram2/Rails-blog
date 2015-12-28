class Category < ActiveRecord::Base
   has_many :posts
 
   def category_params
      params.require(:category).permit(:name)
   end 
end
