FactoryGirl.define do
  factory :new_board, class: Board do
    game_id 1

    factory :non_empty_board do
      state "----o----"
    end

    factory :full_board_tie do
      state "oxooxxxox"
    end
  end
end