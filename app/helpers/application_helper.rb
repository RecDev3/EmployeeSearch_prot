module ApplicationHelper
  # デバイスのエラーメッセージ出力メソッド
  def error_explanation
    return "" if resource.errors.empty?
    html = ""
    # エラーメッセージ用のHTMLを生成
    messages = resource.errors.full_messages.each do |msg|
      html += <<-EOF
        div.error_field, class: 'alert alert-danger', role: 'alert'
          p 'error_msg#{msg}'
      EOF
    end
    html.html_safe
  end

  def simple_time(time)
    time.strftime("%Y-%m-%d　%H:%M　")
  end

end


