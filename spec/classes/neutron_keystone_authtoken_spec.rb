require 'spec_helper'

describe 'neutron::keystone::authtoken' do
  let :params do
    { :password => 'neutron_password', }
  end

  shared_examples 'neutron authtoken' do
    context 'with default parameters' do
      it 'configure keystone_authtoken' do
        should contain_neutron_config('keystone_authtoken/username').with_value('neutron')
        should contain_neutron_config('keystone_authtoken/password').with_value('neutron_password')
        should contain_neutron_config('keystone_authtoken/auth_url').with_value('http://localhost:5000')
        should contain_neutron_config('keystone_authtoken/project_name').with_value('services')
        should contain_neutron_config('keystone_authtoken/user_domain_name').with_value('Default')
        should contain_neutron_config('keystone_authtoken/project_domain_name').with_value('Default')
        should contain_neutron_config('keystone_authtoken/insecure').with_value('<SERVICE DEFAULT>')
        should contain_neutron_config('keystone_authtoken/auth_section').with_value('<SERVICE DEFAULT>')
        should contain_neutron_config('keystone_authtoken/auth_type').with_value('password')
        should contain_neutron_config('keystone_authtoken/www_authenticate_uri').with_value('http://localhost:5000')
        should contain_neutron_config('keystone_authtoken/auth_version').with_value('<SERVICE DEFAULT>')
        should contain_neutron_config('keystone_authtoken/cache').with_value('<SERVICE DEFAULT>')
        should contain_neutron_config('keystone_authtoken/cafile').with_value('<SERVICE DEFAULT>')
        should contain_neutron_config('keystone_authtoken/certfile').with_value('<SERVICE DEFAULT>')
        should contain_neutron_config('keystone_authtoken/delay_auth_decision').with_value('<SERVICE DEFAULT>')
        should contain_neutron_config('keystone_authtoken/enforce_token_bind').with_value('<SERVICE DEFAULT>')
        should contain_neutron_config('keystone_authtoken/http_connect_timeout').with_value('<SERVICE DEFAULT>')
        should contain_neutron_config('keystone_authtoken/http_request_max_retries').with_value('<SERVICE DEFAULT>')
        should contain_neutron_config('keystone_authtoken/include_service_catalog').with_value('<SERVICE DEFAULT>')
        should contain_neutron_config('keystone_authtoken/keyfile').with_value('<SERVICE DEFAULT>')
        should contain_neutron_config('keystone_authtoken/memcache_pool_conn_get_timeout').with_value('<SERVICE DEFAULT>')
        should contain_neutron_config('keystone_authtoken/memcache_pool_dead_retry').with_value('<SERVICE DEFAULT>')
        should contain_neutron_config('keystone_authtoken/memcache_pool_maxsize').with_value('<SERVICE DEFAULT>')
        should contain_neutron_config('keystone_authtoken/memcache_pool_socket_timeout').with_value('<SERVICE DEFAULT>')
        should contain_neutron_config('keystone_authtoken/memcache_pool_unused_timeout').with_value('<SERVICE DEFAULT>')
        should contain_neutron_config('keystone_authtoken/memcache_secret_key').with_value('<SERVICE DEFAULT>')
        should contain_neutron_config('keystone_authtoken/memcache_security_strategy').with_value('<SERVICE DEFAULT>')
        should contain_neutron_config('keystone_authtoken/memcache_use_advanced_pool').with_value('<SERVICE DEFAULT>')
        should contain_neutron_config('keystone_authtoken/memcached_servers').with_value('<SERVICE DEFAULT>')
        should contain_neutron_config('keystone_authtoken/region_name').with_value('<SERVICE DEFAULT>')
        should contain_neutron_config('keystone_authtoken/token_cache_time').with_value('<SERVICE DEFAULT>')
        should contain_neutron_config('keystone_authtoken/service_token_roles').with_value('<SERVICE DEFAULT>')
        should contain_neutron_config('keystone_authtoken/service_token_roles_required').with_value('<SERVICE DEFAULT>')
      end
    end

    context 'when overriding parameters' do
      before do
        params.merge!({
          :www_authenticate_uri                 => 'https://10.0.0.1:9999/',
          :username                             => 'myuser',
          :password                             => 'mypasswd',
          :auth_url                             => 'https://127.0.0.1:5000',
          :project_name                         => 'service_project',
          :user_domain_name                     => 'domainX',
          :project_domain_name                  => 'domainX',
          :insecure                             => false,
          :auth_section                         => 'new_section',
          :auth_type                            => 'password',
          :auth_version                         => 'v3',
          :cache                                => 'somevalue',
          :cafile                               => '/opt/stack/data/cafile.pem',
          :certfile                             => 'certfile.crt',
          :delay_auth_decision                  => false,
          :enforce_token_bind                   => 'permissive',
          :http_connect_timeout                 => '300',
          :http_request_max_retries             => '3',
          :include_service_catalog              => true,
          :keyfile                              => 'keyfile',
          :memcache_pool_conn_get_timeout       => '9',
          :memcache_pool_dead_retry             => '302',
          :memcache_pool_maxsize                => '11',
          :memcache_pool_socket_timeout         => '2',
          :memcache_pool_unused_timeout         => '61',
          :memcache_secret_key                  => 'secret_key',
          :memcache_security_strategy           => 'ENCRYPT',
          :memcache_use_advanced_pool           => true,
          :memcached_servers                    => ['memcached01:11211','memcached02:11211'],
          :manage_memcache_package              => true,
          :region_name                          => 'region2',
          :token_cache_time                     => '301',
          :service_token_roles                  => ['service'],
          :service_token_roles_required         => false,
        })
      end

      it 'configure keystone_authtoken' do
        should contain_neutron_config('keystone_authtoken/www_authenticate_uri').with_value('https://10.0.0.1:9999/')
        should contain_neutron_config('keystone_authtoken/username').with_value(params[:username])
        should contain_neutron_config('keystone_authtoken/password').with_value(params[:password]).with_secret(true)
        should contain_neutron_config('keystone_authtoken/auth_url').with_value(params[:auth_url])
        should contain_neutron_config('keystone_authtoken/project_name').with_value(params[:project_name])
        should contain_neutron_config('keystone_authtoken/user_domain_name').with_value(params[:user_domain_name])
        should contain_neutron_config('keystone_authtoken/project_domain_name').with_value(params[:project_domain_name])
        should contain_neutron_config('keystone_authtoken/insecure').with_value(params[:insecure])
        should contain_neutron_config('keystone_authtoken/auth_section').with_value(params[:auth_section])
        should contain_neutron_config('keystone_authtoken/auth_type').with_value(params[:auth_type])
        should contain_neutron_config('keystone_authtoken/auth_version').with_value(params[:auth_version])
        should contain_neutron_config('keystone_authtoken/cache').with_value(params[:cache])
        should contain_neutron_config('keystone_authtoken/cafile').with_value(params[:cafile])
        should contain_neutron_config('keystone_authtoken/certfile').with_value(params[:certfile])
        should contain_neutron_config('keystone_authtoken/delay_auth_decision').with_value(params[:delay_auth_decision])
        should contain_neutron_config('keystone_authtoken/enforce_token_bind').with_value(params[:enforce_token_bind])
        should contain_neutron_config('keystone_authtoken/http_connect_timeout').with_value(params[:http_connect_timeout])
        should contain_neutron_config('keystone_authtoken/http_request_max_retries').with_value(params[:http_request_max_retries])
        should contain_neutron_config('keystone_authtoken/include_service_catalog').with_value(params[:include_service_catalog])
        should contain_neutron_config('keystone_authtoken/keyfile').with_value(params[:keyfile])
        should contain_neutron_config('keystone_authtoken/memcache_pool_conn_get_timeout').with_value(params[:memcache_pool_conn_get_timeout])
        should contain_neutron_config('keystone_authtoken/memcache_pool_dead_retry').with_value(params[:memcache_pool_dead_retry])
        should contain_neutron_config('keystone_authtoken/memcache_pool_maxsize').with_value(params[:memcache_pool_maxsize])
        should contain_neutron_config('keystone_authtoken/memcache_pool_socket_timeout').with_value(params[:memcache_pool_socket_timeout])
        should contain_neutron_config('keystone_authtoken/memcache_pool_unused_timeout').with_value(params[:memcache_pool_unused_timeout])
        should contain_neutron_config('keystone_authtoken/memcache_secret_key').with_value(params[:memcache_secret_key])
        should contain_neutron_config('keystone_authtoken/memcache_security_strategy').with_value(params[:memcache_security_strategy])
        should contain_neutron_config('keystone_authtoken/memcache_use_advanced_pool').with_value(params[:memcache_use_advanced_pool])
        should contain_neutron_config('keystone_authtoken/memcached_servers').with_value('memcached01:11211,memcached02:11211')
        should contain_neutron_config('keystone_authtoken/region_name').with_value(params[:region_name])
        should contain_neutron_config('keystone_authtoken/token_cache_time').with_value(params[:token_cache_time])
        should contain_neutron_config('keystone_authtoken/service_token_roles').with_value(params[:service_token_roles])
        should contain_neutron_config('keystone_authtoken/service_token_roles_required').with_value(params[:service_token_roles_required])
      end

      it 'installs python memcache package' do
        should contain_package('python-memcache')
      end
    end
  end

  on_supported_os({
    :supported_os => OSDefaults.get_supported_os
  }).each do |os,facts|
    context "on #{os}" do
      let (:facts) do
        facts.merge!(OSDefaults.get_facts())
      end

      it_behaves_like 'neutron authtoken'
    end
  end
end
