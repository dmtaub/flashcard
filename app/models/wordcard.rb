class Wordcard < ApplicationRecord
  validates :word, :definition, presence: true, allow_blank: false
	# Bin 0 -- start/default & review now!
	# Bins 1-11 are associated with the following 'time to next review':
	# Bin 1 - 5 seconds
	# Bin 2 - 25 seconds
	# Bin 3 - 2 minutes
	# Bin 4 - 10 minutes
	# Bin 5 - 1 hour
	# Bin 6 - 5 hours
	# Bin 7 - 1 day
	# Bin 8 - 5 days
	# Bin 9 - 25 days
	# Bin 10 - 4 months
	# Bin 11 - never

	def time_has_come
		reviewed_at.present? and time_to_next_review.ago-reviewed_at > 0
	end
	def time_to_next_appearance
		if reviewed_at.present?
			-[time_to_next_review.ago-reviewed_at,0].min
		else
			Float::INFINITY
		end
	end


  def time_to_next_review
  	case bin
  	when 0
  		0.seconds
  	when 1
  		5.seconds
  	when 2
  		25.seconds
  	when 3
  		2.minutes
  	when 4
  		10.minutes
  	when 5
  		1.hour
  	when 6
  		5.hours
  	when 7
  		1.day
  	when 8
  		5.days
  	when 9
  		25.days
  	when 10
  		4.months
  	else
  		1000.years # essentially infinity, never show
  	end
	end


  def self.current_words
    Wordcard.all.where 'bin < 11'
  end

  def self.available_words
    Wordcard.words_whose_time_has_come
  end

  def self.words_whose_time_has_come
  	ready = current_words.where 'bin == 0'
		found = []
		current_words.where('bin != 0').each do |word|
			found.append word if word.time_has_come
		end

    found.concat(ready)
  end


end
