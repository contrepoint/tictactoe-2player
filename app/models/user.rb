class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :games_as_challenged, :class_name => 'Game', :foreign_key => 'challenged_id'
  has_many :games_as_challenger, :class_name => 'Game', :foreign_key => 'challenger_id'
end
