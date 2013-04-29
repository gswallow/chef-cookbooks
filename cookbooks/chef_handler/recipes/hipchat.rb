chef_handler "Chef::Handler::NotifyRoom" do
#  source "chef/handlers/hipchat_chef"
  arguments [ :api_token => node[:chef_handler][:hipchat][:api_token],
              :room_name => node[:chef_handler][:hipchat][:room_name],
              :notify_users => node[:chef_handler][:hipchat][:notify_users] ]
  supports :exception => :true 
  action :enable
end
