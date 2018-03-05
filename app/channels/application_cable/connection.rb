module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user
    include UserHelper

    def connect
      self.current_user = find_verified_user
      current_user.update_attributes is_online: true
      logger.add_tags "ActionCable", current_user.email
    end

    def disconnect
      current_user.update_attributes is_online: false
      logger.add_tags "ActionCable", current_user.email
      user_left_room current_user
    end

    protected
    def find_verified_user
      if env["warden"].user
        env["warden"].user
      else
        reject_unauthorized_connection
      end
    end
  end
end
