class ChangeCurrentBoardMemberDefaultValueInUsers < ActiveRecord::Migration[5.0]
  def change
    change_column_default :users, :current_board_member, 'false'
  end
end
