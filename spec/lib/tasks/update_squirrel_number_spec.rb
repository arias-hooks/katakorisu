require 'rake_helper'

describe 'squirrel_increase:update_squirrel_number' do
  subject(:task) { Rake.application['squirrel_increase:update_squirrel_number'] }

  let!(:user) { create(:user) }
  let!(:squirrel) { create(:squirrel, user: user) }
  let!(:acorn) { create(:acorn, user: user) }
  let!(:setting) { create(:setting, user: user) }
  let!(:activity) { create(:activity, user: user) }

  it 'update_squirrel_number' do
    expect { task.invoke }.to change { squirrel.reload.number }.from(5).to(6)
  end
end
