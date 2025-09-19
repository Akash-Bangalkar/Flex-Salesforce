public class AccountPhoneUpdater {
    public static void updateAccountPhone(List<Contact> contacts) {
        Set<Id> accountIds = new Set<Id>();

        // Collect Account IDs from updated Contacts
        for (Contact con : contacts) {
            if (con.AccountId != null) {
                accountIds.add(con.AccountId);
            }
        }

        // Query the Accounts that need their Phone field updated
        List<Account> accountsToUpdate = [SELECT Id, Phone FROM Account WHERE Id IN :accountIds];

        // Update the Phone field for each Account based 
        // on the last non-null Contact Phone
        for (Account acct : accountsToUpdate) {
            for (Contact con : contacts) {
                if (con.AccountId == acct.Id && con.Phone != null) {
                    acct.Phone = con.Phone;  // Set Account's Phone to the last Contact's Phone
                }
            }
        }

        // Update the Accounts in the database
        update accountsToUpdate;
    }
    
    // CustomLabel Testing
    public static void customLabelTesting()
    {
        String labelValue = System.Label.PackageXml;
        System.debug('The value of MyCustomLabel is: ' + labelValue);
        
        String labelValue2 = System.Label.Jabra;
        System.debug('The value of MyCustomLabel is: ' + labelValue2);
    }
}