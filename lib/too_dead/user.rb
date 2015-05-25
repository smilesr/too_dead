module TooDead
  #attr_accessor :user
  class User < ActiveRecord::Base
    has_many :todolists#, :dependent => :destroy
    #validate_presence_of:todolists
    # def initialize(x)
    #   @user = user
    # end

    def add_username(first_name)
      User.find_or_create_by(name: first_name)
    end

    def delete_username(first_name)
      User.destroy(name: first_name)
    end

    def edit_username(first_name)
      User.update(name: first_name)
    end
  end
end
