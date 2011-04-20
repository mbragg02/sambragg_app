module ApplicationHelper
  def current_controller?(c)
     controller.controller_name == c
   end
   
   def timenow
     return Time.now
   end
end
