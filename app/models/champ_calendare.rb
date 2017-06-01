class ChampCalendare < ActiveRecord::Base
      validates :champ_name, presence: true
      validates :numb, presence: true, numericality:
		{ only_integer: true, greater_than_or_equal_to: 0 }
      validates :start_date, presence: true
      validates :country, presence: true
      validates :place, presence: true
end
