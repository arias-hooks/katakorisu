require 'rake_helper'

describe 'squirrel_increase:update_squirrel_number' do
  let!(:user) { create(:user) }
  let!(:squirrel) { create(:squirrel, user: user) }
  let!(:acorn) { create(:acorn, user: user) }
  let!(:setting) { create(:setting, user: user) }
  let!(:activity) { create(:activity, user: user) }
  subject(:task) { Rake.application['squirrel_increase:update_squirrel_number'] }

  it 'update_squirrel_number' do
    expect { task.invoke }.to change { squirrel.reload.number }.from(5).to(6)
  end
end
