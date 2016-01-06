module PageHelper
  def set_notice
    if flash[:notice]
     raw "<div class='alert'>#{notice}</div>"
    end
  end
end
