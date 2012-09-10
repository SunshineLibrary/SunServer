#encoding: UTF-8

module MachinesHelper
  def link_to_machine_sign_out(machine, user)
    link_to_delete("登出", {:controller => "machines", :action => "sign_out", :id => machine.id}, :user_id => user.id, :confirm => "确定要登出吗？", :method => :post)
  end
  
end
