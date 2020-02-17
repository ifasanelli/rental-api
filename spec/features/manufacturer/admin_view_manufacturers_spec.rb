require 'rails_helper'

feature 'Admin view manufactures' do
  scenario 'successfully' do
    user = User.create(email: 'it@it.com', password: '123456', name: 'Italo')
    login_as(user, scope: :user)
    visit root_path

    click_on 'Fabricantes'

    expect(page).to have_content('Ford')
    expect(page).to have_content('Volkswagen')
    expect(page).to have_link('Voltar')
  end

  scenario 'and see manufacturer details' do
    user = User.create(email: 'it@it.com', password: '123456', name: 'Italo')
    login_as(user, scope: :user)
    visit root_path
    click_on 'Fabricantes'
    click_on 'Ford'

    expect(page).to have_content('Ford')
    expect(page).to have_link('Voltar')
  end
end