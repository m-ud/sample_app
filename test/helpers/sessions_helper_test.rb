require 'test_helper'

class SessionsHelperTest < ActionView::TestCase

  def setup
    @user = users(:michael)
    remember(@user)
  end

  test "current_user returns right user when session is nil" do 
    assert_equal @user, current_user #渡されたユーザーが現在のユーザーと一致しているか？
    assert is_logged_in? #ログインできているか？
  end

  test "current_user returns nil when remember digest is wrong" do
    @user.update_attribute(:remember_digest, User.digest(User.new_token)) #@userのremember_digestを更新
    assert_nil current_user #ユーザーの記憶digestが記憶トークンと正しく対応してない場合nilとなるか？
  end
end