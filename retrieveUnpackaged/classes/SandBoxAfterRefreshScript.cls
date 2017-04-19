//Hey, Nutant !

global class SandBoxAfterRefreshScript implements SandboxPostCopy {
    global void runApexClass(SandboxContext context) {
        System.debug('Sandbox is referessed.  ' + context.organizationId()
           + ' ' + context.sandboxId() + context.sandboxName());

        List<String> lstUserName = new List<String>{'Stacey Rauh','Erik Teitsma'};
        List<User> Ulist  =  [SELECT Id FROM User WHERE Name IN :lstUserName AND IsActive = False];
        
        for(User us: Ulist){
            us.IsActive = True;
        }
        Database.Update(Ulist, false);
        
        List<User> UlistA  =  [SELECT Id FROM User WHERE Name IN :lstUserName AND IsActive = True];
        
        List<PermissionSet> lstPermissionSet = [SELECT Id FROM PermissionSet WHERE Label = 'Allow Edit Access on Account' LIMIT 1];
        List<PermissionSetAssignment> lstPersmissionSetAssignment = new List<PermissionSetAssignment>();
        
        if(!lstPermissionSet.isEmpty()){
            for(User us: UlistA){
                PermissionSetAssignment permissionSetAssign = new PermissionSetAssignment();
                permissionSetAssign.AssigneeId = us.Id;
                permissionSetAssign.PermissionSetId = lstPermissionSet[0].Id;
                lstPersmissionSetAssignment.add(permissionSetAssign);
            }
            Database.Insert(lstPersmissionSetAssignment);
        }

    }
}