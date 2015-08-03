# webservices

Esta práctica consiste en consumir un web services desde una ORG salesforce a otra

Herramientas:

	SoapUI : http://www.soapui.org/
	force.com : https://www.login.salesforce.com/

1- Descargar SoapUI e Instalarlo
2- Dentro de la carpeta Recursos, se encuentra un archivo XML de la estructura de los objetos
3- En base al XML generar las clases para el punto de comunicación

4- Esperar instrucciones.


Estructura del web services:

	REQUEST

	<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ser="http://soap.sforce.com/schemas/class/services_ws">
	   <soapenv:Header>
	      <ser:SessionHeader>
	         <ser:sessionId> ? </ser:sessionId>
	      </ser:SessionHeader>
	   </soapenv:Header>
	   <soapenv:Body>
	      <ser:getDataCode>
	         <ser:country> ? </ser:country>
	         <ser:city> ? </ser:city>
	         <ser:municipality> ? </ser:municipality>
	         <ser:codex> ? </ser:codex>
	      </ser:getDataCode>
	   </soapenv:Body>
	</soapenv:Envelope>


	RESPONSE


	<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns="http://soap.sforce.com/schemas/class/services_ws" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	   <soapenv:Body>
	      <getDataCodeResponse>
	         <result xsi:type="codex__c">
	            <Id> ? </Id>
	            <Name> ? </Name>
	            <municipality__c> ? </municipality__c>
	            <municipality__r xsi:type="municipality__c">
	               <Id> ? </Id>
	               <Name> ? </Name>
	               <city__c> ? </city__c>
	               <city__r xsi:type="city__c">
	                  <Id> ? </Id>
	                  <Name> ? </Name>
	                  <country__c> ? </country__c>
	                  <country__r xsi:type="country__c">
	                     <Id> ? </Id>
	                     <Name> ? </Name>
	                  </country__r>
	               </city__r>
	            </municipality__r>
	            <township__c> ? </township__c>
	            <type__c> ? </type__c>
			 </result>
	      </getDataCodeResponse>
	   </soapenv:Body>
	</soapenv:Envelope>

