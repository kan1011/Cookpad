module ApplicationHelper
  def notice_message
    flash_messages = []
    flash.each do |type, message|
      type = 'success' if type == 'notice'
      type = 'error' if type == 'alert'
      type = 'warning' if type == 'warning'
      if message.is_a? Array
        message.each do |msg|
          text = "<script>toastr.#{type}('#{msg}');</script>"
          flash_messages << text.html_safe if msg
        end
      else
        text = "<script>toastr.#{type}('#{message}');</script>"
        flash_messages << text.html_safe if message
      end
    end

    flash_messages.join("\n").html_safe
  end
end
