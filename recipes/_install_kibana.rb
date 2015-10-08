bash 'run_install-Kibana' do
 not_if { File.exist?('/opt/kibana') }
 user 'root'
 code <<-EOC
    cd /tmp
    tar xvf /tmp/kibana.tar.gz
    mkdir -p /opt/kibana
    cp -R /tmp/kibana-4.1.2-linux-x64/* /opt/kibana/
  EOC
end

remote_file '/etc/init.d/kibana4' do
 source 'https://gist.githubusercontent.com/thisismitch/8b15ac909aed214ad04a/raw/bce61d85643c2dcdfbc2728c55a41dab444dca20/kibana4'
 checksum 'dfee621eb9e516ccca95e31c41284f8eb76807c25efa4d93a06de86b298dd08c'
 notifies :run, 'bash[run_install-KibanaService]', :immediately
end

bash 'run_install-KibanaService' do
 user 'root'
 code <<-EOC
    chmod +x /etc/init.d/kibana4
    update-rc.d kibana4 defaults 96 9
  EOC
end

service 'kibana4' do
 supports status: true, restart: true, reload: true
 action [:enable, :start]
ends
