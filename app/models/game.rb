class Game < ActiveRecord::Base
  has_one :board
  belongs_to :challenger, class_name: 'User'
  belongs_to :challenged, class_name: 'User'

  after_create :set_board_id, :create_board, on: :create

  private
    def set_board_id
      self.board_id = self.id
      self.save
    end
end
