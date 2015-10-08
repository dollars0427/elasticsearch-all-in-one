#
# Cookbook Name:: elasticsearch-all-in-one
# Recipe:: default

include_recipe "elasticsearch-all-in-one::_install_java"

include_recipe "elasticsearch-all-in-one::_install_elasticsearch"

include_recipe "elasticsearch-all-in-one::_install_kibana"

include_recipe "elasticsearch-all-in-one::_install_td-agent"
