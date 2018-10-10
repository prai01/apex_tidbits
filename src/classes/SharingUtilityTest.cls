@isTest
private class SharingUtilityTest {
   // Test for the manualShareRead method
   static testMethod void testManualShareRead(){
      // Select users for the test.
      List<User> users = [SELECT Id FROM User WHERE IsActive = true LIMIT 2];
      Id User1Id = users[0].Id;
      Id User2Id = users[1].Id;
   
      // Create new job.
      Account acct = new Account();
      acct.Name = 'Test Job';
      acct.OwnerId = user1Id;
      TriggerState.turnOffTrigger();
      insert acct;    
      TriggerState.turnOnTrigger();
       
      // Insert manual share for user who is not record owner.
      System.assertEquals(SharingUtility.manualShareRead(acct.Id, user2Id), true);
   
      // Query job sharing records.
      List<AccountShare> acctShrs = [SELECT Id, UserOrGroupId, AccountAccessLevel, 
         RowCause FROM AccountShare WHERE AccountId = :acct.Id AND UserOrGroupId= :user2Id];
      
      // Test for only one manual share on job.
      System.assertEquals(acctShrs.size(), 1, 'Set the object\'s sharing model to Private.');
      
      // Test attributes of manual share.
      System.assertEquals(acctShrs[0].AccountAccessLevel, 'Read');
      System.assertEquals(acctShrs[0].RowCause, 'Manual');
      System.assertEquals(acctShrs[0].UserOrGroupId, user2Id);
      
      // Test invalid job Id.
      delete acct;   
   
      // Insert manual share for deleted job id. 
      System.assertEquals(SharingUtility.manualShareRead(acct.Id, user2Id), false);
   }  
}