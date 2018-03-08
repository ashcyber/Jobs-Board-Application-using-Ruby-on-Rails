require 'test_helper'

class ContactTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @contact = Contact.new(name: "Example User", email: "ishans632@gmail.com", 
    contact_number: "932839282",message: "Sample Text")
  end 
  
  
  test "should be valid" do 
    assert @contact.valid? 
  end 
  
  test "name should not be too long" do
    @contact.name = "a" * 51 
    assert_not @contact.valid?  
  end
  
  test "email should be present" do
    @contact.email = ""
    assert_not @contact.valid?
  end
  
  
  
  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
        @contact.email = invalid_address
        assert_not @contact.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end 
  
end
