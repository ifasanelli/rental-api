require 'rails_helper'

feature 'Admin view car models' do
  scenario 'successfully' do
    user = User.create(email: 'it@it.com', password: '123456', name: 'Italo')
    login_as(user, scope: :user)
    visit root_path

    click_on 'Modelos'

    expect(page).to have_content('Ka')
    expect(page).to have_link('Voltar')
  end

  scenario 'and see car model details' do
    user = User.create(email: 'it@it.com', password: '123456', name: 'Italo')
    login_as(user, scope: :user)
    visit root_path
    click_on 'Modelos'
    click_on 'Ka'

    expect(page).to have_content('Ka')
    expect(page).to have_content('1.0')
    expect(page).to have_content('2019')
    expect(page).to have_content('Gasolina')
    expect(page).to have_link('Voltar')
  end
end