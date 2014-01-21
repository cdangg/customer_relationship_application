require_relative "contact"

class Rolodex

  def initialize
    @contacts = []
    @id = 1000
  end

  def add_new_contact
    @id += 1
    print "Enter First Name: "
    first_name = gets.chomp
    print "Enter Last Name: "
    last_name = gets.chomp
    print "Enter the Email Address: "
    email = gets.chomp
    print "Please input any notes: "
    notes = gets.chomp
    contact = Contact.new(@id, first_name, last_name, email, notes)
    @contacts << contact

  end

  def find_contact(id)
    @contacts.each {|contact| return contact if contact.id == id}
  end

  def find_by_email(email)
    @contacts.each {|contact| return contact if contact.email == email}
  end

  def display_all_contacts
    puts "Here are the contacts currently stored: "
    @contacts.each do |contact|
      puts "#{contact.id}"
      puts "#{contact.first_name}"
      puts "#{contact.last_name}"
      puts "#{contact.email}"
      puts "#{contact.notes}"
    end
  end

  def delete_a_contact
    puts "Please enter the email you would like to delete: "
    delete = gets.chomp
    contact = find_by_email(delete)
    @contacts.delete(contact)
    puts "Your #{delete} has been deleted"
  end

  def modify_existing_contact
    puts "Enter the Email Address you want to modify: "
    email = gets.chomp
    contact = find_by_email(email)
    puts "Please enter the attribute you would like to modify (first name, last name, email, notes"
    edit = gets.chomp
    puts "You've entered #{edit}, please enter the new value"
    new_input = gets.chomp

    contact.first_name = new_input if edit == "first name"
    contact.last_name = new_input if edit == "last name"
    contact.email = new_input if edit == "email"
    contact.notes = new_input if edit == "notes"

    puts "Your #{edit} is now changed to #{new_input}"

  end

  def display_an_attribute
    puts "Please enter the attribute you would like to display (first name, last name, email, notes): "
    attribute = gets.chomp
    @contacts.each do |contact|
      if attribute == "first name"
        puts contact.first_name
      elsif attribute == "last name"
        puts contact.last_name
      elsif attribute == "email"
        puts contact.email
      elsif attribute == "notes"
        puts contact.notes
      else
        puts "No attribute is found"

      end
    end
  end

end

