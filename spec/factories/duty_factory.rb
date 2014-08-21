FactoryGirl.define do
  factory :duty do
    obliged { FactoryGirl.create :user }
    turn
  end
end
