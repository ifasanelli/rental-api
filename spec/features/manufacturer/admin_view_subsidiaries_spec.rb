require 'rails_helper'

feature 'Admin view subsidiaries' do
  scenario 'successfully' do
    visit root_path
    click_on 'Filiais'

    expect(page).to have_content('Filial Santos')
    expect(page).to have_link('Voltar')
  end

  scenario 'and see manufacturer details' do
    visit root_path
    click_on 'Filiais'
    click_on 'Filial Santos'

    expect(page).to have_content('Filial Santos')
    expect(page).to have_content('60837199000139')
    expect(page).to have_content('Rua de Santos, 13')
    expect(page).to have_link('Voltar')
  end
end