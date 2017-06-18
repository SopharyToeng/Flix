require 'spec_helper'

describe "Deleting a movie", :type => :feature do
  it "destroys the movie and shows the movie listing without the deleted movie" do
    movie = Movie.create(title: "Iron Man",
                          rating: "PG-13",
                          total_gross: 318412101.00,
                          description: "Tony Stark builds an armored suit to fight the throes of evil",
                          released_on: "2008-05-02")

    visit movie_path(movie)

    click_link 'Delete'

    expect(current_path).to eq(movies_path)
    expect(page).not_to have_text(movie.title)
  end
end
