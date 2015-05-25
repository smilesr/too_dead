$LOAD_PATH.unshift(File.dirname(__FILE__))

require "too_dead/version"
require 'too_dead/init_db'
require 'too_dead/user'
require 'too_dead/todo_list'
require 'too_dead/todo_item'

require 'pry' 
require 'vedeu'

module TooDead
 # attr_accessor :name, :todo_list, :todo_item, :carry_the_category_name, :user, :first_name
  class Menu
    def iniitalize
      # @first_name = first_name
      # @todo_item = todo_item
      # @todo_list = todo_list
      @carry_the_category_name = carry_the_category_name
      @user = user
    # include Vedeu
    end
    
    def execute_menu
 
      ask_for_username
      puts ""
      ask_to_add_or_change_account
      add_todolist
      add_todoitem
    end

    def ask_for_username
      puts "what is your username (in other words, your first name):"
      result = gets.chomp
      @first_name = User.find_or_create_by(name: result)
#       @user = User.add_username(result)
#       @user.add_username(result)
    end

    def ask_to_add_or_change_account
      puts "would you like to (1) create or edit a to-do list or (2) edit or delete your name:"
      choice = gets.chomp
      until choice =~ /^[12]$/
 #     until choice == 2
        puts "You must enter (1) if you want to create or edit a to-do list or (2) delete or change your account name"
        choice = gets.chomp
      end
      if choice.to_i == 2
        #@first_name.delete_username
        edit_delete_username
      end
    end

    def edit_delete_username
      puts "Do you want to (1) delete your account, or (2) edit your account name:"
      account_choice = gets.chomp
#      until account_choice == 1 || account_choice == 2
      until account_choice =~ /^[12]$/
        puts "You must enter (1) if you want to create or edit a to-do list or (2) delete or change your account name"
        account_choice = gets.chomp
      end
      if account_choice.to_i == 1
        @first_name.destroy #(name: name)
      elsif account_choice.to_i == 2
        puts "What would you like your new account name to be:"
        new_name = gets.chomp
        # User.edit_username(name: new_name)
        # User.update(name: new_name)
        @first_name.update(name: new_name)
      end
    end

    def add_todolist
      puts "What is the name of the to-do list that you would like to create, edit or delete:"
      result = gets.chomp
      @todolist = TodoList.find_or_create_by(category: result)
      @carry_the_category_name = result
    end

    def add_todoitem
      puts "What task do you want to add to the #{@carry_the_category_name} category:"
      result = gets.chomp
      @todo_item = TodoItem.find_or_create_by(items: result)
      puts "What is the due date for this task:"
      result_date = gets.chomp
      result_status = 'false'
      @todo_item.update(date: result_date)
      @todo_item.update(status: result_status)
    end
 binding.pry
  end
end
