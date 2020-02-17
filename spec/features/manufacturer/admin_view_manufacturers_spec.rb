require 'rails_helper'

feature 'Admin view manufactures' do
  scenario 'successfully' do
    visit root_path
    click_on 'Fabricantes'

    expect(page).to have_content('Ford')
    expect(page).to have_content('Volkswagen')
    expect(page).to have_link('Voltar')
  end

  scenario 'and see manufacturer details' do
    visit root_path
    click_on 'Fabricantes'
    click_on 'Ford'

    expect(page).to have_content('Ford')
    expect(page).to have_link('Voltar')
  end
end