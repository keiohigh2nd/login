class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
<<<<<<< HEAD
  include DSessionsHelper
=======
>>>>>>> 8e8e1ad165ff0211b4502d055cb1561fa0495e4d
end
