feature "adding new bookmarks" do
    scenario "user can add a bookmark" do
        visit 'bookmarks/new'
        fill_in('url', with: 'https://www.bbcgoodfood.com/')
        fill_in('title', with: 'BBC Good Food')
        click_button('Submit')
        expect(page).to have_link('BBC Good Food', href: 'https://www.bbcgoodfood.com/')
   end
   scenario "user can cancel the action" do
     visit 'bookmarks/new'
     expect(page).to have_link('Cancel action', href: '/bookmarks')
   end
end
