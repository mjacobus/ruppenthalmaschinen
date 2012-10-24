module ApplicationHelper
  def ganalytics
    account = GA_CODE
  
    code = <<STRING 
    <script type="text/javascript">
      var _gaq = _gaq || [];
      _gaq.push(['_setAccount', '#{account}']);
      _gaq.push(['_trackPageview']);

      (function() {
        var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
      })();

    </script>
STRING
    raw code if Rails.env.production?
  end
  
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