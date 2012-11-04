#encoding: UTF-8

module MachinesHelper
  def link_to_machine_sign_out(machine, user)
    link_to_delete("登出", 
                   {:controller => "machines", :action => "sign_out", :id => machine.id}, 
                   :user_id => user.id, 
                   :confirm => "确定要登出吗？", 
                   :method => :post)
  end
  
  def link_to_machine_lock(machine)    
    link_to(content_tag(:i, "", :class => "icon-lock icon-white") + " 锁定", 
            {:controller => "machines", :action => "lock", :id => machine.id},
             :class => "btn btn-danger",
             :confirm => "确定要锁定吗？", 
             :method => :post)
  end
  
  def link_to_machine_unlock(machine)    
    link_to(content_tag(:i, "", :class => "icon-ok-circle icon-white") + " 解锁", 
            {:controller => "machines", :action => "unlock", :id => machine.id},
             :class => "btn btn-primary",
             :confirm => "确定要解锁吗？", 
             :method => :post)
  end
  
  
  
  
end
