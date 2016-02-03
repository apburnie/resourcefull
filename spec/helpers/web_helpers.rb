
def sign_up(email:'test@email.com', name:"Camilla", password:"password")
  visit 'users/sign_up'
  fill_in 'Email', with: email
  fill_in 'Name', with: name
  fill_in 'Password', with: password
  fill_in 'Password confirmation', with: password
  click_button 'Sign up'
end

def add_item(name: "Ruby book", path: './spec/fixtures/ruby.png')
  visit 'items/new'
  fill_in 'Name', with: name
  attach_file 'Image', path
  click_button 'Add item'
end
