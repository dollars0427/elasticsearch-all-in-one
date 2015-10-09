remote_file '/tmp/elasticsearch.deb' do
 source 'https://download.elastic.co/elasticsearch/elasticsearch/elasticsearch-1.7.2.deb'
 checksum '791fb9f2131be2cf8c1f86ca35e0b912d7155a53f89c2df67467ca2105e77ec2'
 notifies :run, 'execute[run_install-elasticsearch]', :immediately
end

execute 'run_install-elasticsearch' do
 command 'dpkg -i /tmp/elasticsearch.deb || apt-get -f install -y'
 user 'root'
 action :nothing
end

template "/etc/elasticsearch/elasticsearch.yml" do
   mode 0644
   owner "root"
   group "root"
   source "elasticsearch.yml.erb"
 end

bash 'run_autostart-elasticsearch' do
 user 'root'
 code <<-EOC
    update-rc.d elasticsearch defaults 90 10
  EOC
end

service 'elasticsearch' do
 supports status: true, restart: true, reload: true
 action [:enable, :start]
end
