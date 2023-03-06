require 'rails_helper'

RSpec.describe 'the bachelorette show page' do
	before :each do
		@hannah = Bachelorette.create!(name: "Hannah Brown", season_number: 15, season_description: "The Most Dramatic Season Yet!")
		@erica = Bachelorette.create!(name: "Erica Rose", season_number: 1, season_description: "The First Season Ever!")
		
		@brad = @hannah.contestants.create!(name: "Brad Smith", age: 30, hometown: "Denver, CO")
		@steve = @hannah.contestants.create!(name: "Steve Duck", age: 28, hometown: "Cleveland, OH")
		visit "/bachelorettes/#{@hannah.id}"
	end

	describe 'As a visitor, when I visit the bachelorette show page' do
		it 'I see the bachelorette name, season number, and season description' do
			expect(page).to have_content("Hannah Brown")
			expect(page).to have_content("Season 15 - The Most Dramatic Season Yet!")
		end

		it 'I see a link to see that bachelorettes contestants' do
			expect(page).to have_link("See the Contestants")			
		end

		it 'When I click the link I am taken to the Bachelorettes Contestants Index Page' do
			click_link("See the Contestants")
			expect(current_path).to eq("/bachelorettes/#{@hannah.id}/contestants")	
		end
	end
end