class Stop < ActiveRecord::Base
  belongs_to :lines
  belongs_to :stations
  validates :line_id, :presence => true
  validates :station_id, :presence => true
  validates :stop_time, format: { with: /\A\d{2}[:]\d{2}\z/, on: :create}

end
