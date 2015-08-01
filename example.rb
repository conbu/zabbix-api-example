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

  def items(graphid)
    # items = zabbix.graphs.get_items(graphid)
    items = zabbix.items.get(output: 'extend', graphids: graphid)
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
    graphname = graph['name']
    next unless graphname.include? 'Associations'
    next unless graphname.include? 'Total'
    graphid = graph['graphid'].to_i
    puts '%03d: %s' % [graphid, graphname]
    items = zm.items(graphid.to_s)
    items.each do |item|
      next unless item['name'].include? 'GHz'
      puts '%03d: %s' % [item['itemid'].to_i, item['name']]
    end
  end
end

if __FILE__ == $0 then
  main
end
