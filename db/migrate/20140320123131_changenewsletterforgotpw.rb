class Changenewsletterforgotpw < ActiveRecord::Migration
  def change
    rename_column :newsletters, :remove_email, :forgot_pw
  end
end
