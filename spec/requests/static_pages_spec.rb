require 'spec_helper'

describe "StaticPages" do
	describe "Home page" do
    	it "should have the content SampleApp" do
    		visit '/static_pages/home'
    		expect(page).to have_content('Sample App')    		
    	end

    	it "should have the title home" do
    		visit "/static_pages/home"
    		expect(page).to have_title('Home')
    	end

      it "should have the base title" do
        visit "/static_pages/home"
        expect(page).to have_title('Rail SampleApp')
      end
  	end

  	describe "Help page" do
  		it "should have the content Help" do
  			visit '/static_pages/help'
  			expect(page).to have_content('Help')
  		end
  	end

  	describe "About page" do
  		it "should have the content About" do
  			visit '/static_pages/about'
  			expect(page).to have_content('About')
  		end
  	end
end
