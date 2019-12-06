feature "deleting a bookmark" do
  scenario "user can delete a bookmark" do
    visit 'bookmarks/new'
    fill_in('url', with: "https://www.bbcgoodfood.com/")
    fill_in('title', with: "BBC Good Food")
    click_button("Submit")

    visit "bookmarks/delete"
    fill_in('url', with: "https://www.bbcgoodfood.com/")
    click_button("Submit")

    expect(page).not_to have_link("BBC Good Food")
  end

  scenario "user can cancel the action" do
    visit 'bookmarks/delete'
    expect(page).to have_link("Cancel action", href: "/bookmarks")
  end
end
