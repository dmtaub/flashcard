class WelcomeController < ApplicationController
  def index

		unless Wordcard.available_words.present?
			unless Wordcard.current_words.present?
		    	@notice = 'You have no more words to review; you are permanently done!'
	    	else
				@notice = 'You are temporarily done; please come back later to review more words.'
			end
		else
			@available = Wordcard.available_words.first
			@available.reviewed_at = DateTime.now
			@available.save
		end

		@notice ||= flash[:notice]

		render 'index'
  end
end
