require 'spec_helper'

describe 'runtime' do

  context 'when runtime is running' do
    describe service('talend-runtime') do
      it { should be_enabled }
      it { should be_running }
    end

    sleep 15
    describe port(8041) do
      it { should be_listening }
    end

    describe port(9002) do
      it { should be_listening }
    end

  end

  describe file('/opt/talend/runtime/etc/org.ops4j.pax.web.cfg') do
    its(:content) { should include 'org.osgi.service.http.port=8041' }
    its(:content) { should include 'org.osgi.service.http.port.secure=9002' }
  end

  describe file('/opt/talend/runtime/etc/org.talend.esb.locator.cfg') do
    its(:content) { should include 'endpoint.http.prefix=http://localhost:8041/services' }
    its(:content) { should include 'endpoint.https.prefix=https://localhost:9002/services' }
  end

  describe file('/opt/talend/runtime/etc/org.apache.karaf.shell.cfg') do
    its(:content) { should include 'sshPort = 8102' }
  end

  describe file('/opt/talend/runtime/etc/org.apache.karaf.management.cfg') do
    its(:content) { should include 'rmiRegistryPort = 1100' }
    its(:content) { should include 'rmiServerPort = 44445' }
  end

  describe file('/opt/talend/runtime/etc/org.talend.remote.jobserver.server.cfg') do
    its(:content) { should include 'org.talend.remote.jobserver.server.TalendJobServer.COMMAND_SERVER_PORT=8010' }
    its(:content) { should include 'org.talend.remote.jobserver.server.TalendJobServer.FILE_SERVER_PORT=8011' }
    its(:content) { should include 'org.talend.remote.jobserver.server.TalendJobServer.MONITORING_PORT=8898' }
    its(:content) { should include 'org.talend.remote.jobserver.server.TalendJobServer.PROCESS_MESSAGE_PORT=8556' }
  end

  describe file('/opt/talend/runtime/etc/users.properties') do
    its(:content) { should include 'tadmin=password,_g_:admingroup,sl_admin' }
    its(:content) { should include 'tesb=password,_g_:admingroup,sl_maintain' }
    its(:content) { should include 'karaf = password,_g_:admingroup' }
  end

end

