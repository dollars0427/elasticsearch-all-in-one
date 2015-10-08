bash 'Install Java' do
 not_if 'which java'
 user 'root'
 code <<-EOC
    apt-get install python-software-properties -y
    apt-get install software-properties-common -y
    add-apt-repository ppa:webupd8team/java -y
    apt-get update
    echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
    echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections
    sudo apt-get -y install oracle-java7-installer
  EOC
end
