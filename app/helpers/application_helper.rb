module ApplicationHelper
  def messages
    html = ''
    
    unless @messages_already_shown
      html += '<div class="messages">'
    
      if notice
        html +=  '<p class="notice">' + notice + '</p>'
      end
      
      if alert
        html +=  '<p class="alert">' + alert + '</p>'
      end

      html += '</div>'
      
      @messages_already_shown = true
    end
    
    raw html
  end

end
