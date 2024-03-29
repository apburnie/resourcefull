require 'rails_helper'

feature 'Request items' do
  context 'when signed in' do
    before do
      sign_up
      add_item
      click_link 'Sign out'
    end

    feature 'making a request' do
      it 'shows a Request link' do
        visit '/items'
        sign_up(email:'me@email.com', name:"Katie", password:"Secret01")
        expect(current_path).to eq '/'
        expect(page).to have_content 'Ruby book'
        expect(page).to have_link "Request"
      end

      context 'a request has been made' do
        before do
          visit '/items'
          sign_up(email:'me@email.com', name:"Katie", password:"Secret01")
          click_link "Request"
        end

        it 'shows Katie made a request' do
          expect(page).to have_content "You requested this from Camilla"
          expect(page).to have_content "Ruby book requested! Get in touch with Camilla to get it"
          expect(page).not_to have_link "Request"
        end

        xit 'allows Katie to cancel her request' do
          click_link 'Cancel'
          expect(page).to have_link "You have cancelled your request"
          expect(page).to have_content "Ruby book Katie"
          expect(page).to have_link "Request"
        end

        context 'when signed in as Camilla' do
          before do
            click_link "Sign out"
            log_in
          end

          it "alerts Camilla that a request has been made" do
            expect(page).to have_content("You have requests")
            expect(page).to have_link("Manage request")
          end

          it "displays pending requests on borrowings page" do
            visit('/borrowings')
            expect(page).to have_content "Have you given this to Katie?"
            expect(page).to have_link "Yup, item transferred!"
            expect(page).to have_link "Decline"
          end

          it "enables rejection of request" do
            visit('/borrowings')
            click_link "Decline"
            expect(page).not_to have_content "Katie has requested this item"
          end

          it "allows a request to be accepted" do
            visit('/borrowings')
            click_link "Yup, item transferred!"
            expect(page).not_to have_content "Ruby book"
          end

          it "Katie can rerequest the book" do
            visit('/borrowings')
            click_link "Decline"
            click_link "Sign out"
            log_in(email:'me@email.com', password:"Secret01")
            expect(page).not_to have_content "Katie requested 'Ruby book'"
          end
        end
      end

    end
  end
end
