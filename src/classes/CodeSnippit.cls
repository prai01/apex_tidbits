/*
Code Snippits
*/


/*
- ConnectApi namespace is aka Chatter in Apex, that provides methods to access Chatter data and functionality.
- It executes in user context, not in system mode.

e.g. - Get the chatter influence rank
*/
ConnectApi.UserDetail userData = ConnectApi.ChatterUsers.getUser(null, UserInfo.getUserId());
System.debug('userData='+userData);
System.debug('chatterInfluenceRank='+userData.chatterInfluence.rank);


Http h = new Http();
HttpRequest req = new HttpRequest();
req.setEndpoint(Url.getOrgDomainUrl().toExternalForm() + '/services/data/v44.0/limits');
req.setMethod('GET');
req.setHeader('Authorization', 'Bearer ' + UserInfo.getSessionId());
req.setHeader('Content-Type', 'application/json');
HttpResponse res = h.send(req);
System.debug('res='+res.getBody());

