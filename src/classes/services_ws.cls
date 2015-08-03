global with sharing class services_ws {


	webservice static list<codex__c> getDataCode(String country, String city, String municipality, String codex){
		list<codex__c> response = new list<codex__c>();

		String strWhere = 'where ';

		if(country != null && country != ''){
		    strWhere += 'municipality__r.city__r.country__r.Name like \'%'+country+'%\' and ';
		}
		if(city != null && city != ''){
		    strWhere += 'municipality__r.city__r.Name like \'%'+city+'%\' and ';
		}
		if(municipality != null && municipality != ''){
		    strWhere += 'municipality__r.Name like \'%'+municipality+'%\' and ';
		}
		if(codex != null && codex != ''){
		    strWhere += 'Name like \'%'+codex+'%\' and ';
		}		

		String strQuery = 'Select Id, Name, township__c, type__c, municipality__r.Name, municipality__r.city__r.Name, municipality__r.city__r.country__r.Name FROM codex__c ' + strWhere.substring(0, strWhere.length() -4);

		    response = Database.query(strQuery);

        return strWhere.length() > 6 ? response : new list<codex__c>();
	}	
}