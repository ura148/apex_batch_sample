global class SendEmailSchedular implements Schedulable {
  global void execute(SchedulableContext sc) {
    SendEmailToAllUser se = new SendEmailToAllUser();
    database.executebatch(se,200);
  }
}
