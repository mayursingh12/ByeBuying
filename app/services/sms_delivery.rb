class SmsDelivery

  URL = 'http://bhashsms.com/api/sendmsg.php'

  SENDER = 'BYEBUY'
  USER = 'ravikataria'
  PASS = '123'
  PRIORITY = 'ndnd'
  STYLE = 'normal'

  def initialize(number, text)
    @number = number
    @text = text
  end

  def deliver
    HTTP.get(URL,
             params: {sender: SENDER,
                      user: USER,
                      pass: PASS,
                      priority: PRIORITY,
                      style: STYLE,
                      phone: @number,
                      text: @text,

             })
  end

end