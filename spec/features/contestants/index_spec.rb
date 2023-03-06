require 'rails_helper'

RSpec.describe 'the contestants show page' do
	before :each do
		@hannah = Bachelorette.create!(name: "Hannah Brown", season_number: 15, season_description: "The Most Dramatic Season Yet!")
		@erica = Bachelorette.create!(name: "Erica Rose", season_number: 1, season_description: "The First Season Ever!")
		
		@brad = @hannah.contestants.create!(name: "Brad Smith", age: 30, hometown: "Denver, CO")
		@steve = @hannah.contestants.create!(name: "Steve Duck", age: 28, hometown: "Cleveland, OH")
		@dan = @hannah.contestants.create!(name: "Dan Paul", age: 24, hometown: "New York, NY")		
		@joe = @erica.contestants.create!(name: "Joe Smith", age: 30, hometown: "Denver, CO")
		visit "/bachelorettes/#{@hannah.id}/contestants"
	end

	describe 'As a visitor, when I visit the bachelorettes contestants show page' do
		it 'shows the contestants name, age, and hometown for that season' do
			save_and_open_page
			expect(page).to have_content("Name: Brad Smith, Age: 30, Hometown: Denver, CO")
			expect(page).to have_content("Name: Steve Duck, Age: 28, Hometown: Cleveland, OH")
			expect(page).to have_content("Name: Dan Paul, Age: 24, Hometown: New York, NY")
			expect(page).to_not have_content("Name: Joe Smith, Age: 30, Hometown: Denver, CO")
		end
	end
end