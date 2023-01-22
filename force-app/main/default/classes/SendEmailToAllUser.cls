public class SendEmailToAllUser implements Database.Batchable<sObject>, Database.Stateful {

  public Database.QueryLocator start(Database.BatchableContext BC){
    String accountQuery = 'SELECT Id FROM Account LIMIT 10';
    return Database.getQueryLocator(accountQuery);
  }
  public void execute(Database.BatchableContext BC, List<Account> accList){
    List<Account> updList = new List<Account>();

    for(Account acc : accList){
        Account newAcc = new Account();
        newAcc.Id = acc.Id;
        newAcc.Industry = 'Healthcare';
        updList.add(newAcc);
    }
    if(updList.size() > 0){
        update updList;
    }
  }

  public void finish(Database.BatchableContext BC){
  }
}
