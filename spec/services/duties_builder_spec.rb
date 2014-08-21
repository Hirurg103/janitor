require 'rails_helper'

def to_friday(time)
  (time.beginning_of_week + 4.days).to_date
end

describe DutiesBuilder do
  context 'a turn' do
    let(:turn) { create :turn }

    context 'with three members: Dzmitry, Andrew and Alex' do
      let(:dzmitry) { create :user, email: 'dzmitry@example.com' }
      let(:andrew) { create :user, email: 'andrew@example.com' }
      let(:alex) { create :user, email: 'alex@example.com' }

      context 'joined this week' do
        before do
          turn.members = [dzmitry, andrew, alex]
          turn.reload
        end

        context 'generating the duties for the current and next three weeks' do
          let(:ongoing_duties) {
            DutiesBuilder.call(turn, to_friday(Date.today), to_friday(3.weeks.from_now))
          }

          it 'should return four duties' do
            ongoing_duties.should have(4).items
          end

          it 'should Dzmitry to be first on duty' do
            ongoing_duties.first.obliged.should == dzmitry
          end

          it 'should Andrew to be next on duty after Dzmitry' do
            ongoing_duties.second.obliged.should == andrew
          end

          it 'should Alex to be next on duty after Andrew' do
            ongoing_duties.third.obliged.should == alex
          end

          it 'should Dzmitry to be on duty again after Alex' do
            ongoing_duties.last.obliged.should == dzmitry
          end
        end
      end
    end
  end
end
