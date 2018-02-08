Puppet::Type.type(:ironic_neutron_agent_config).provide(
  :ini_setting,
  :parent => Puppet::Type.type(:openstack_config).provider(:ini_setting)
) do

  def self.file_path
    '/etc/neutron/plugins/ml2/ironic_neutron_agent.ini'
  end

  # added for backwards compatibility with older versions of inifile
  def file_path
    self.class.file_path
  end

end
