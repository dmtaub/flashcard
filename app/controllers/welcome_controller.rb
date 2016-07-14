class WelcomeController < ApplicationController
  def index
  	if flash[:notice]
  		@notice = flash[:notice]
  	else
  		@notice ||= ""
  	end

		unless Wordcard.available_words.present?
			@notice += " -- " if @notice.length > 0 # divider for now
			unless Wordcard.current_words.present?
		    	@notice += 'You have no more words to review; you are permanently done!'
	    	else
				@notice += 'You are temporarily done; please come back later to review more words.'
			end
		else
			@available = Wordcard.available_words.first
		end
		puts "22",@notice

		render 'index'
  end
end
