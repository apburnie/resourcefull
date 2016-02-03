
def sign_up(email:'test@email.com', name:"Camilla", password:"password")
  visit 'users/sign_up'
  fill_in 'user_name', with: name
  fill_in 'user_email', with: email
  fill_in 'user_password', with: password
  click_button 'Sign up'
end

def log_in(email:'test@email.com', password:"password")
  visit 'users/sign_in'
  fill_in 'user_email', with: email
  fill_in 'user_password', with: password
  click_button 'Log in'
end

def add_item(name: "Ruby book", path: './spec/fixtures/ruby.png')
  visit 'items/new'
  fill_in 'item_name', with: name
  attach_file 'item_image', path
  click_button 'Add item'
end
