class Board < ActiveRecord::Base
  belongs_to :game

# Mark a spot
# should empty_cell? return true/false or call mark_the_spot?
	def empty_cell?(position)
		if self.state[position] == "-"
			return true
		else
			return false
		end
	end

  def mark_the_spot(position, marker)
		self.state[position] = marker
    self.save
	end

end
