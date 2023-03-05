# frozen_string_literal: true

module SelectizeMacros
  def select_selectized(name, value)
    # Search
    fill_in "#{name}-selectized", with: value

    # Select
    input = find("##{name}-selectized").ancestor('.selectize-input')
    input.sibling('.selectize-dropdown').find('.option', text: value).click
    within(input) { expect(page).to have_css('.item', text: value) }
  end
end
