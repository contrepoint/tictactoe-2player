FactoryGirl.define do
  factory :new_board, class: Board do

    factory :non_empty_board do
      state "----o----"
    end

    factory :board_tie do
      state "oxooxxxox"
    end

    factory :non_full_board_won do
      state "xxx------"
    end

    factory :full_board_won do
      state "ooxxxoxxo"
    end
  end
end