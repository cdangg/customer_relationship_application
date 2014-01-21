require_relative "contact"
require_relative "rolodex"

class CRA
  @rolodex = Rolodex.new

  def self.print_main_menu
    puts "[1] Add a new contact"
    puts "[2] Modify an existing contact"
    puts "[3] Delete a contact"
    puts "[4] Display all the contacts"
    puts "[5] Display an attribute"
    puts "[6] Exit"
    puts "Enter a number: "
  end

  def self.main_menu

    print_main_menu
    user_selected = gets.to_i
    call_option(user_selected)
  end

  def self.call_option(user_selected)
    @rolodex.add_new_contact if user_selected == 1
    @rolodex.modify_existing_contact if user_selected == 2
    @rolodex.delete_a_contact if user_selected == 3
    @rolodex.display_all_contacts if user_selected == 4
    @rolodex.display_an_attribute if user_selected == 5
    exit if user_selected == 6

    main_menu
  end
end

CRA.main_menu
