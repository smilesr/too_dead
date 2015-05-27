module TooDead
  #attr_accessor :user
  class User < ActiveRecord::Base
    has_many :todo_lists#, :dependent => :destroy
    #validate_presence_of:todolists
    # def initialize(x)
  #   @user = user
    # end

#     def add_username(result)
#       User.find_or_create_by(name: result)
#       self.find_or_create_by(name: result)
#     end
#   end
# end
#     def delete_username$#(first_name)
#       User.destroy#(name: )
#     end

#     def edit_username#(first_name)
#       User.update#(name: first_name)
#     end
   end
 end
