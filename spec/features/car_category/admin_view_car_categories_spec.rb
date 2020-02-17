require 'rails_helper'

feature 'Admin view car categories' do
  scenario 'successfully' do
    user = User.create(email: 'it@it.com', password: '123456', name: 'Italo')
    login_as(user, scope: :user)
    visit root_path

    click_on 'Categorias'

    expect(page).to have_content('A')
    expect(page).to have_content('AA')
    expect(page).to have_link('Voltar')
  end

  scenario 'and see car category details' do
    user = User.create(email: 'it@it.com', password: '123456', name: 'Italo')
    login_as(user, scope: :user)
    visit root_path
    click_on 'Categorias'
    click_on 'A'

    expect(page).to have_content('A')
    expect(page).to have_content('99.95')
    expect(page).to have_content('39.99')
    expect(page).to have_content('25.95')
    expect(page).to have_link('Voltar')
  end
end