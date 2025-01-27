# == Class: neutron::params
#
# Parameters for puppet-neutron
#
class neutron::params {
  include openstacklib::defaults
  $pyvers = $::openstacklib::defaults::pyvers

  $client_package              = "python${pyvers}-neutronclient"
  $ovs_agent_service           = 'neutron-openvswitch-agent'
  $destroy_patch_ports_service = 'neutron-destroy-patch-ports'
  $linuxbridge_agent_service   = 'neutron-linuxbridge-agent'
  $cisco_config_file           = '/etc/neutron/plugins/cisco/cisco_plugins.ini'
  $opencontrail_plugin_package = 'neutron-plugin-contrail'
  $opencontrail_config_file    = '/etc/neutron/plugins/opencontrail/ContrailPlugin.ini'
  $midonet_server_package      = "python${pyvers}-networking-midonet"
  $midonet_server_package_ext  = "python${pyvers}-networking-midonet-ext"
  $midonet_config_file         = '/etc/neutron/plugins/midonet/midonet.ini'
  $ovn_plugin_package          = "python${pyvers}-networking-ovn"
  $vpp_plugin_package          = "python${pyvers}-networking-vpp"
  $vpp_agent_service           = 'neutron-vpp-agent'
  $plumgrid_plugin_package     = 'networking-plumgrid'
  $plumgrid_pythonlib_package  = 'plumgrid-pythonlib'
  $plumgrid_config_file        = '/etc/neutron/plugins/plumgrid/plumgrid.ini'
  $nuage_config_file           = '/etc/neutron/plugins/nuage/plugin.ini'
  $dhcp_agent_service          = 'neutron-dhcp-agent'
  $haproxy_package             = 'haproxy'
  $metering_agent_service      = 'neutron-metering-agent'
  $l3_agent_service            = 'neutron-l3-agent'
  $metadata_agent_service      = 'neutron-metadata-agent'
  $ovn_metadata_agent_service  = 'networking-ovn-metadata-agent'
  $bgp_dragent_service         = 'neutron-bgp-dragent'
  $bagpipe_bgp_package         = 'openstack-bagpipe-bgp'
  $bgpvpn_bagpipe_package      = "python${pyvers}-networking-bagpipe"
  $bgpvpn_bagpipe_service      = 'bagpipe-bgp'
  $bgpvpn_plugin_package       = "python${pyvers}-networking-bgpvpn"
  $l2gw_agent_service          = 'neutron-l2gw-agent'
  $nsx_plugin_package          = 'vmware-nsx'
  $nsx_config_file             = '/etc/neutron/plugins/vmware/nsx.ini'
  $sfc_package                 = "python${pyvers}-networking-sfc"
  $group                       = 'neutron'
  $mlnx_agent_package          = 'python-networking-mlnx'
  $eswitchd_service            = 'eswitchd'

  if($::osfamily == 'Redhat') {
    $nobody_user_group                  = 'nobody'
    $package_name                       = 'openstack-neutron'
    $server_service                     = 'neutron-server'
    $server_package                     = false
    $api_package_name                   = false
    $api_service_name                   = false
    $rpc_package_name                   = false
    $rpc_service_name                   = false
    $ml2_server_package                 = 'openstack-neutron-ml2'
    $ovs_agent_package                  = false
    $ovs_server_package                 = 'openstack-neutron-openvswitch'
    $ovs_cleanup_service                = 'neutron-ovs-cleanup'
    $libnl_package                      = 'libnl'
    $package_provider                   = 'rpm'
    $linuxbridge_agent_package          = false
    $linuxbridge_server_package         = 'openstack-neutron-linuxbridge'
    $sriov_nic_agent_service            = 'neutron-sriov-nic-agent'
    $sriov_nic_agent_package            = 'openstack-neutron-sriov-nic-agent'
    $bigswitch_lldp_package             = 'openstack-neutron-bigswitch-lldp'
    $bigswitch_agent_package            = 'openstack-neutron-bigswitch-agent'
    $bigswitch_lldp_service             = 'neutron-bsn-lldp'
    $bigswitch_agent_service            = 'neutron-bsn-agent'
    $cisco_server_package               = 'openstack-neutron-cisco'
    $nvp_server_package                 = 'openstack-neutron-nicira'
    $dhcp_agent_package                 = false
    $metering_agent_package             = 'openstack-neutron-metering-agent'
    $vpnaas_agent_package               = 'openstack-neutron-vpnaas'
    $l2gw_agent_package                 = 'openstack-neutron-l2gw-agent'
    $l2gw_package                       = "python${pyvers}-networking-l2gw"
    $ovn_metadata_agent_package         = "python${pyvers}-networking-ovn-metadata-agent"
    $dynamic_routing_package            = false
    $bgp_dragent_package                = 'openstack-neutron-bgp-dragent'
    if $::operatingsystemrelease =~ /^7.*/ or $::operatingsystem == 'Fedora' {
      $openswan_package = 'libreswan'
    } else {
      $openswan_package = 'openswan'
    }
    $libreswan_package                  = 'libreswan'
    $metadata_agent_package             = false
    $l3_agent_package                   = false
    $fwaas_package                      = 'openstack-neutron-fwaas'
    $neutron_wsgi_script_path           = '/var/www/cgi-bin/neutron'
    $neutron_wsgi_script_source         = '/usr/bin/neutron-api'
    $networking_baremetal_package       = 'python2-networking-baremetal'
    $networking_baremetal_agent_package = 'python2-ironic-neutron-agent'
    $networking_baremetal_agent_service = 'ironic-neutron-agent'
    $networking_ansible_package         = "python${pyvers}-networking-ansible"
    $mlnx_agent_service                 = 'neutron-mlnx-agent'
  } elsif($::osfamily == 'Debian') {
    $nobody_user_group          = 'nogroup'
    $package_name               = 'neutron-common'
    if $::os_package_type =='debian' {
      $ml2_server_package       = false
      $server_service           = false
      $server_package           = false
      $api_package_name         = 'neutron-api'
      $api_service_name         = 'neutron-api'
      $rpc_package_name         = 'neutron-rpc-server'
      $rpc_service_name         = 'neutron-rpc-server'
      $dynamic_routing_package  = 'python3-neutron-dynamic-routing'
    } else {
      $ml2_server_package = 'neutron-plugin-ml2'
      $server_service           = 'neutron-server'
      $server_package           = 'neutron-server'
      $api_package_name         = false
      $api_service_name         = false
      $rpc_package_name         = false
      $rpc_service_name         = false
      $dynamic_routing_package  = "python${pyvers}-neutron-dynamic-routing"
    }
    $bgp_dragent_package        = 'neutron-bgp-dragent'
    $ovs_agent_package          = 'neutron-openvswitch-agent'
    $ovs_server_package         = 'neutron-plugin-openvswitch'
    $ovs_cleanup_service        = false
    $libnl_package              = 'libnl1'
    $package_provider           = 'dpkg'
    $linuxbridge_agent_package  = 'neutron-linuxbridge-agent'
    $linuxbridge_server_package = 'neutron-plugin-linuxbridge'
    $sriov_nic_agent_service    = 'neutron-sriov-agent'
    $sriov_nic_agent_package    = 'neutron-sriov-agent'
    $cisco_server_package       = 'neutron-plugin-cisco'
    $nvp_server_package         = 'neutron-plugin-nicira'
    $dhcp_agent_package         = 'neutron-dhcp-agent'
    $metering_agent_package     = 'neutron-metering-agent'
    $vpnaas_agent_package       = 'python-neutron-vpnaas'
    $openswan_package           = 'strongswan'
    $libreswan_package          = false
    $metadata_agent_package     = 'neutron-metadata-agent'
    $l3_agent_package           = 'neutron-l3-agent'
    $fwaas_package              = "python${pyvers}-neutron-fwaas"
    $l2gw_agent_package         = 'neutron-l2gateway-agent'
    $l2gw_package               = "python${pyvers}-networking-l2gw"
    $neutron_wsgi_script_path   = '/usr/lib/cgi-bin/neutron'
    $neutron_wsgi_script_source = '/usr/bin/neutron-api'
    $mlnx_agent_service         = 'neutron-plugin-mlnx-agent'
  } else {
    fail("Unsupported osfamily ${::osfamily}")
  }
}
