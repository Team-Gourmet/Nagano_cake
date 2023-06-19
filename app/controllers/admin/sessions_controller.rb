# frozen_string_literal: true

class Admin::SessionsController < Devise::SessionsController
 
  # 新規登録後のリダイレクト先をマイページへ
    def after_sign_in_path_for(resource)
        admin_path
    end
    def after_sign_out_path_for(resource)
        new_admin_session_path
    end
end
