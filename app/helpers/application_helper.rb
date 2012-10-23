module ApplicationHelper
  def messages
    html = ''
    
    unless @messages_already_shown
      html += '<div id="messages">'
    
      if notice
        html +=  '<p class="notice">' + notice + '<span class="close">x</span></p>'
      end
      
      if alert
        html +=  '<p class="alert">' + alert + '<span class="close">x</span></p>'
      end

      html += '</div><div class="messages"></div>'
      
      @messages_already_shown = true
    end
    
    raw html
  end

end
