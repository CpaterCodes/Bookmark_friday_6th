feature "visiting the landing page" do
    scenario "seeing the Bookmark Manager" do
        visit '/'
        expect(page).to have_content "Bookmark Manager"
    end
    scenario "Have several options" do
      visit '/'
      expect(page).to have_link("See bookmarks", href: '/bookmarks')
      expect(page).to have_link("Add bookmark", href: '/bookmarks/new')
      expect(page).to have_link("Delete bookmark", href: '/bookmarks/delete')
    end
end
