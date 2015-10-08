remote_file '/tmp/td-agent.deb' do
 source 'http://packages.treasuredata.com.s3.amazonaws.com/2/ubuntu/trusty/pool/contrib/t/td-agent/td-agent_2.2.1-0_amd64.deb'
 checksum 'bcede08895575ec54b89670587d52d0a0a4c9d15cbc96b3eef3ef364cbc540df'
 notifies :run, 'execute[run_install-td-agent]', :immediately
end

execute 'run_install-td-agent' do
 command 'dpkg -i /tmp/td-agent.deb || apt-get -f install -y'
 user 'root'
 action :nothing
end

bash 'Install Plugins' do
 not_if 'which make'
 user 'root'
 code <<-EOC
    sudo apt-get install make libcurl4-gnutls-dev --yes
    sudo /opt/td-agent/embedded/bin/fluent-gem install fluent-plugin-elasticsearch
    sudo /opt/td-agent/embedded/bin/fluent-gem install fluent-plugin-record-reformer
    EOC
end
