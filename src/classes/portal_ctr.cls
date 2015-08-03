public with sharing class portal_ctr {

	public String country {get; set;}
	public String city {get; set;}
	public String municipality {get; set;}
	public String codex {get; set;}

	public list<codex__c> lsCodex {get; set;}

	public portal_ctr() {
		this.country  = '';
		this.city  = '';
		this.municipality  = '';
		this.codex  = '';

		this.lsCodex = new list<codex__c>();
	}

	public void sendRequest(){
		lsCodex = new list<codex__c>();

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

		list<codex__c> lsTmp = Database.query(strQuery);
		
		if(lsTmp.size() > 0)
			lsCodex = lsTmp;
	}

	public PageReference cleanRequest(){
		this.country  = '';
		this.city  = '';
		this.municipality  = '';
		this.codex  = '';

		this.lsCodex = new list<codex__c>();

		return null;
	}

}