powershell_script 'Install IIS' do
  code 'Add-WindowsFeature Web-Server'
  guard_interpreter :powershell_script
  not_if "(Get-WindowsFeature -Name Web-Server).Installed"
end

file 'c:\inetpub\wwwroot\Default.htm' do
  content 'Hello, World'
end

service 'w3svc' do
  action [:start, :enable]
end
