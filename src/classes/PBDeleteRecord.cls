//Pass in ID of anything, and have it deleted

@InvocableMethod(label='Delete a record', description='Delete any record ProcessBuilder desire for')
public static void DeleteRecord(List<String> recordIds){
    List<sObject> deleteObject = List<sObject>();
    for(String recordId: recordIds){
        Id rId = id.valueOf(recordId);
        sObject so = rId.getSObjectType().newSObject(rId);
        deleteObject.add(so);
    }
    delete deleteObject;
}