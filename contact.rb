# require 'pry'


gem 'activerecord', '=4.2.9'
require 'active_record'
require 'mini_record'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'crm.sqlite3')


class Contact < ActiveRecord::Base

  field :first_name, as: :string
  field :last_name,  as: :string
  field :email,      as: :string
  field :note,       as: :text

  def full_name
    "#{first_name} #{last_name}"
  end

end

Contact.auto_upgrade!




# kaiser = Contact.create("Kaiser", "Chan", "kaiser@chan.com", "Always so serious")
# diane = Contact.create("Diane", "Chang", "diane@chang.com", "The best")
# celeste = Contact.create("Celeste", "Chan", "celeste@chan.com", "The cutest baby girl ever")
# connor = Contact.create("Connor", "Chan", "connor@chan.com", "Maybe the baby brother?")

# puts Contact.all.inspect
# puts Contact.find(1003).inspect
# puts Contact.find_by("first name", "Kaiser").inspect

# puts Contact.delete_all.inspect
# puts Contact.all.inspect

# puts Contact.find_by("Kaiser Chan").inspect
# puts Contact.delete(1000).inspect

# puts kaiser.update("notes", "always hangry").inspect
# puts Contact.find_by("first_name", "Kaiser").inspect

# kaiser.delete
# puts Contact.all.inspect


# @@contacts = []
# @@id = 1000
#
# # This method should initialize the contact's attributes
# def initialize(first_name, last_name, email, notes)
#     @first_name = first_name
#     @last_name = last_name
#     @email = email
#     @notes = notes
#
#     @id = @@id
#     @@id += 1
#     # @contacts = @@contacts
# end
#
# # This method should call the initializer,
# # store the newly created contact, and then return it
# def self.create(first_name, last_name, email, notes = "N/A")
#   new_contact = Contact.new(first_name, last_name, email, notes)
#   @@contacts << new_contact
#   return new_contact
# end
#
# # This method should return all of the existing contacts
# def self.all
#   @@contacts
# end
#
# # def self.first_name
# #   @first_name
# # end
# #
# # def self.last_name
# #   @last_name
# # end
#
# # This method should accept an id as an argument
# # and return the contact who has that id
#
# def self.find(id)
#   @@contacts.select do |find|
#     if id == find.id
#       return find
#     end
#   end
# end
#
# # This method should allow you to specify
# # 1. which of the contact's attributes you want to update
# # 2. the new value for that attribute
# # and then make the appropriate change to the contact
# def update(attribute, value)
#   if attribute == "first_name"
#     @first_name = value
#   elsif attribute == "last_name"
#     @last_name = value
#   elsif attribute == "email"
#     @email = value
#   elsif attribute == "notes"
#     @notes = value
#   end
# end
#
# # This method should work similarly to the find method above
# # but it should allow you to search for a contact using attributes other than id
# # by specifying both the name of the attribute and the value
# # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
# def self.find_by(attribute, value)
#   @@contacts.select do |entry|
#
#     # while value != entry.first_name || value != entry.last_name || value != entry.email
#     #   puts "Invalid Input. Contact does not exist. Please re-enter."
#     #   value = gets.chomp
#     # end
#
#     if attribute == "first_name" && value == entry.first_name
#       return entry
#     elsif attribute == "last_name" && value == entry.last_name
#       return entry
#     elsif attribute == "email" && value == entry.email
#       return entry
#     # else
#       # puts "Invalid Input. Contact does not exist"
#     end
#   end
# end
#
# # This method should delete all of the contacts
# def self.delete_all
#   @@contacts = @@contacts.delete(@@contacts)
# end
#
# # The followings are getting and setter of arguments
# def id
#   @id
# end
#
# def first_name
#   @first_name
# end
#
# def first_name=(first_name)
#   @first_name = first_name
# end
#
# def last_name
#   @last_name
# end
#
# def last_name=(last_name)
#   @last_name = last_name
# end
#
# def email
#   @email
# end
#
# def email=(email)
#   @email = email
# end
#
# def notes
#   @notes
# end
#
# def notes=(notes)
#   @notes = notes
# end
#
# # This mehod returns the full name of contact
# def full_name
#   "#{first_name} #{last_name}"
# end
#
# # This method should delete the contact
# # HINT: Check the Array class docs for built-in methods that might be useful here
#
# # def self.delete(id)
# #   @@contacts.select do |find|
# #     if id == find.id
# #       @@contacts.delete(find)
# #       return @@contacts
# #     end
# #   end
# # end
#
# def delete
#   @@contacts.delete(self)
# end
#
# # Feel free to add other methods here, if you need them.
