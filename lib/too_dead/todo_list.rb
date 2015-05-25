module TooDead
  class TodoList < ActiveRecord::Base
    has_many :todoitems#, :dependent => :destroy
   # validate_presence_of :todoitems
    belongs_to :users#, :dependent => :delete_list
   # validate_presence_of :users
   # attr_accessor :todolist
   #  def initialize
   #    @todolist = todolist
   #  end

    def add_list(list_name)
      Todolist.find_or_create_by(category: list_name)
    end

    def delete_list(list_name)
      TodoList.destroy(category: list_name)
    end

    def edit_list(list_name)
      TodoList.update(category: list_name)
    end
  end
end