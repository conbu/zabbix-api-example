#!/usr/bin/env ruby
#

require 'pit'
require 'zabbixapi'

class ZabbixManager
  attr_reader :zabbix

  def initialize(user, password)
    @zabbix = ZabbixApi.connect(
      :url => 'http://zabbix.conbu.net/api_jsonrpc.php',
      :user => user,
      :password => password,
    )
  end

  def print_version
    version = @zabbix.query(
      :method => "apiinfo.version",
      :params => {}
    )
    puts version
  end

  def graphs
    graphs = zabbix.graphs.get(output: 'extend', hostids: 10084)
  end
end

def main
  config = Pit.get('zabbix',
                           :require => {
    user: 'zabbix username',
    password: 'zabbix password',
  })
  zm = ZabbixManager.new(config[:user], config[:password])
  zm.print_version
  zm.graphs.each do |graph|
    puts graph['name']
  end
end

if __FILE__ == $0 then
  main
end
