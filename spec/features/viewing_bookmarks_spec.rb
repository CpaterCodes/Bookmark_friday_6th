feature "viewing a list of bookmarks" do

  scenario "a user can see all bookmarks" do
    # no longer necessary due to spec_helper
    # connection = PG.connect(dbname: 'bookmark_manager_test')

    # Add the test data
    Bookmark.create(url: "http://www.makersacademy.com", title: "Makers")
    Bookmark.create(url: "http://www.destroyallsoftware.com", title: "Destroy All Software")
    Bookmark.create(url: "http://www.google.com", title: "Google")

    visit '/bookmarks'

    expect(page).to have_link("Makers", href: "http://www.makersacademy.com")
    expect(page).to have_link("Google", href: "http://www.google.com")
  end

  scenario "a user can return to the main menu" do
    visit '/bookmarks'
    expect(page).to have_link("Return to main", href: "/")
  end
end
