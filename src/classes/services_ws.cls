global with sharing class services_ws {


	webservice static list<contentCodeElement> getDataCode(String country, String city, String municipality, String codex){
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

		String strQuery = 'Select Id, Name, township__c, type__c, municipality__r.Id, municipality__r.Name, municipality__r.city__r.Id, municipality__r.city__r.Name, municipality__r.city__r.country__r.Id, municipality__r.city__r.country__r.Name FROM codex__c ' + strWhere.substring(0, strWhere.length() -4);

		    response = Database.query(strQuery);

		list<contentCodeElement> lsResponse = new list<contentCodeElement>();

		if(strWhere.length() > 6){
			for(codex__c ls : response){

				contentCountryElement tmpCountry = new contentCountryElement();
					tmpCountry.FOLIO = ls.municipality__r.city__r.country__r.Id;
					tmpCountry.NAME = ls.municipality__r.city__r.country__r.Name;

				contentCityElement tmpCity = new contentCityElement();
					tmpCity.FOLIO = ls.municipality__r.city__r.Id;
					tmpCity.Name = ls.municipality__r.city__r.Name;
					tmpCity.country_r = tmpCountry;

				contentMunicipalityElement tmpMunicipality = new contentMunicipalityElement();
					tmpMunicipality.FOLIO = ls.municipality__r.Id;
					tmpMunicipality.Name = ls.municipality__r.Name;
					tmpMunicipality.city_r = tmpCity;

				contentCodeElement tmpCodex = new contentCodeElement();
					tmpCodex.FOLIO = ls.Id;
					tmpCodex.NAME = ls.Name;
					tmpCodex.TOWNSHIP = ls.township__c;
					tmpCodex.TYPE = ls.type__c;
					tmpCodex.municipality_r = tmpMunicipality;

				lsResponse.add(tmpCodex);

			}
		}


        return lsResponse.size() > 0 ? lsResponse : new list<contentCodeElement>();
	}

	global class contentCodeElement{
        webservice String FOLIO {get; set;}
        webservice String NAME {get; set;}
        webservice String TOWNSHIP {get; set;}
        webservice String TYPE {get; set;}
        webservice contentMunicipalityElement municipality_r {get; set;}
    }
	
	global class contentMunicipalityElement{
        webservice String FOLIO {get; set;}
        webservice String NAME {get; set;}
        webservice contentCityElement city_r {get; set;}
    }

    global class contentCityElement{
        webservice String FOLIO {get; set;}
        webservice String NAME {get; set;}
        webservice contentCountryElement country_r {get; set;}
    }

    global class contentCountryElement{
        webservice String FOLIO {get; set;}
        webservice String NAME {get; set;}
    }    
}