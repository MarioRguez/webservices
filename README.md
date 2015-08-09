# webservices

Esta práctica consiste en consumir un web services desde una ORG salesforce a otra

Herramientas:

	SoapUI : http://www.soapui.org/
	force.com : https://www.login.salesforce.com/

1- Descargar SoapUI e Instalarlo.

2- Dentro de la carpeta Recursos, se encuentra un archivo XML de la estructura de los objetos.

3- En base al XML generar las clases para el punto de comunicación.

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
	      	 <result>
	            <FOLIO> ? </FOLIO>
	            <municipality_r>
	               <city_r>
	                  <country_r>
	                     <FOLIO> ? </FOLIO>
	                     <NAME> ? </NAME>
	                  </country_r>
	                  <FOLIO> ? </FOLIO>
	                  <NAME> ? </NAME>
	               </city_r>
	               <FOLIO> ? </FOLIO>
	               <NAME> ? </NAME>
	            </municipality_r>
	            <NAME> ? </NAME>
	            <TOWNSHIP> ? </TOWNSHIP>
	            <TYPE> ? </TYPE>
	         </result>
	      </getDataCodeResponse>
	   </soapenv:Body>
	</soapenv:Envelope>


