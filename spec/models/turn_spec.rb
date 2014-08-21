require 'rails_helper'

describe Turn do
  context 'a turn' do
    let(:turn) { create :turn }

    context 'and last time members changed month ago' do
      let(:members) { create_list :user, 2 }
      before do
        Timecop.travel 1.month.ago do
          turn.members << members
        end

        turn.reload.members_changed_at.should == 1.month.ago.to_date
      end

      context 'when someone joins the turn' do
        let(:member) { create :user }
        before { turn.members << member }

        it 'should change the time when members were changed' do
          turn.reload.members_changed_at.should == Date.today
        end
      end

      context 'when someone leaves the turn' do
        before { turn.members.destroy members.sample }

        it 'should change the time when members were changed' do
          turn.reload.members_changed_at.should == Date.today
        end
      end
    end
  end
end
