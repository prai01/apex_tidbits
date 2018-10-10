/*
Metadata - The Schema class contains for getting metatdata about objects.
*/
List<String> customObjects = new List<String>();

List<Schema.SObjectType> allObjects = Schema.getGlobalDescribe().values();

for(Schema.SObjectType nextObject: allObjects){
    DescribeSObjectResult objectInfo = nextObject.getDescribe();
    if (objectInfo.isCustom()){
        customObjects.add(objectInfo.getName());
    }
}

customObjects.sort();
for (String co:customObjects){
    System.debug(co);
}
