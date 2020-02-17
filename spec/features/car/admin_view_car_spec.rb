require 'rails_helper'

feature 'Admin view cars' do
  scenario 'successfully' do
    user = User.create(email: 'it@it.com', password: '123456', name: 'Italo')
    login_as(user, scope: :user)
    visit root_path

    click_on 'Carros'

    expect(page).to have_content('1')
    expect(page).to have_content('ABC-1234')
    expect(page).to have_content('Prata')
    expect(page).to have_content('120')
    expect(page).to have_content('Ocupado')
    expect(page).to have_link('Voltar')
  end

  scenario 'and see car category details' do
    user = User.create(email: 'it@it.com', password: '123456', name: 'Italo')
    login_as(user, scope: :user)
    visit root_path
    click_on 'Carros'
    click_on '1'

    expect(page).to have_content('1')
    expect(page).to have_content('ABC-1234')
    expect(page).to have_content('Prata')
    expect(page).to have_content('120')
    expect(page).to have_content('Ocupado')
    expect(page).to have_link('Voltar')
  end
end