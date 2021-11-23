# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :customer_state, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  def customer_state
    @customer = Customer.find_by(email: params[:customer][:email])
    return if !@customer
    if @customer.valid_password?(params[:customer][:password]) && (@customer.active_for_authentication? == false)
       # is_deletedの値がfalseだった場合createアクションを実行させる
        flash[:error] = "退会済みです。再度ご登録をしてご利用ください。"
        redirect_to new_customer_registration_path
      # is_deletedの値がtrueだった場合
      # falseだった場合サインアップ画面に遷移する処理を実行する
    else
        flash[:error] = "項目を入力してください"
    end
  end


end
