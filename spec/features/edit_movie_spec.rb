require 'spec_helper'

describe 'Editing a movie', :type => :feature do
  it "updates the movie and shows the movie's updated details" do
    movie = Movie.create(title: "Iron Man",
                          rating: "PG-13",
                          total_gross: 318412101.00,
                          description: "Tony Stark builds an armored suit to fight the throes of evil",
                          released_on: "2008-05-02")

    visit movie_url(movie)

    click_link 'Edit'

    expect(current_path).to eq(edit_movie_path(movie))

    expect(find_field('Title').value).to eq(movie.title)

    fill_in 'Title', with: "Updated Movie Title"

   click_button 'Update Movie'

   expect(current_path).to eq(movie_path(movie))

   expect(page).to have_text('Updated Movie Title')
  end
end
