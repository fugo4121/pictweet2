class ApplicationController < ActionController::Base

  # deviseコントローラーに関連する処理の場合に行う(サインイン等)
  # ※ deviseコントローラーは編集不要のため、コマンドでファイルをコピーしていない
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

    # deviseのストロングパラメータは編集不可、共通コントローラーで定義
    # よって、devise_parameter_sanitizerメソッドを使用
    # 新たに定義するプライベートメソッドの中で使用
    # deviseのUserモデルを利用したパラメーターを取得
    
    # 以下、deviseの処理名≒アクション名
    # :sign_in	サインイン（ログイン）    の処理を行うときのuserモデルの要求
    # :sign_up	サインアップ（新規登録）  の処理を行うときのuserモデルの要求
    # :account_update	アカウント情報更新 の処理を行うときのuserモデルの要求

  def configure_permitted_parameters  
    #サインアップの時、コマンドで追加した「nickname」カラムの要求許可
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end

end
