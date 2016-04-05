class Duty < ActiveRecord::Base
  belongs_to :obliged, class_name: 'User'
  belongs_to :turn

  validates_presence_of :obliged, :turn, :appointed_at

  scope :between, ->(start_date, end_date) do
    where(created_at: start_date..end_date)
  end

  validate :appointed_to_friday

  private

  def appointed_to_friday
    unless appointed_at.friday?
      errors.add :appointed_at, 'Duty has to be appointed to Friday'
    end
  end
end
