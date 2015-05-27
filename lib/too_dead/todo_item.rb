module TooDead
  class TodoItem < ActiveRecord::Base
    belongs_to :todo_list#, :dependent => :delete
#validates_presence_of :todolists
    # attr_accessor :todoitem, :date_due, :completed
    # def intialize
    #   @todoitem = todoitem
    #   @date_due = date_due
    #   @completed = completed
    # end

    # def add_item(item_name)
    #   Todoitem.find_or_create_by(items: item_name)
    # end

    # def delete_item(item_name)
    #   Todoitem.destroy(items: item_name)
    # end

    # def edit_item(item_name)
    #   Todoitem.update(items: item_name)
    # end
  
    # def set_date(due_date)
    #   self.todoitem(date: due_date)
    # end

    # def completed?(done_yet)
    #   self.todoitem(status: done_yet)
    # end
  end
end
