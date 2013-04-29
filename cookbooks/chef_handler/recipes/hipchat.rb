# Make sure the gem is installed from compile time.
p = gem_package "hipchat" do
  action :nothing
end
p.run_action("install")

# Likeweise, register the chef handler from compile time.
h = chef_handler "HipChat::NotifyRoom" do
  source "#{node['chef_handler']['handler_path']}/hipchat.rb"
  arguments [ node[:chef_handler][:hipchat][:api_token],
              node[:chef_handler][:hipchat][:room_name],
              node[:chef_handler][:hipchat][:notify_users] ]
  supports :exception => :true 
  action :nothing
end
h.run_action("enable")
