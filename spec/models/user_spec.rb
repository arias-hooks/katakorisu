require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Userのバリデーション' do
    it 'line_user_idが存在すれば有効' do
      user = build(:user)
      expect(user).to be_valid
    end

    it 'line_user_idが空なら無効' do
      user = build(:user, line_user_id: '')
      expect(user.valid?).to eq(false)
    end

    it 'line_user_idが重複していたら無効' do
      user = create(:user)
      user_with_duplicate_line_user_id = build(:user, line_user_id: user.line_user_id)
      expect(user_with_duplicate_line_user_id.valid?).to eq(false)
    end
  end
end
