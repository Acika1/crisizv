(:: pragma bea:global-element-parameter parameter="$fault1" element="ns1:fault" location="../../CRIS_DATATYPES/xsd/http_soap/MessageContext.xsd" ::)
(:: pragma bea:local-element-return type="ns0:Response/ns0:CommonResponse" location="../wsdl/PregledZahteva.wsdl" ::)

declare namespace ns1 = "http://www.bea.com/wli/sb/context";
declare namespace ns0 = "http://cr.services/xsd";
declare namespace xf = "http://tempuri.org/CRIS_UVERENJA_ZA_IZVRSITELJE/transformation/PregledZahtevaErrorHandler/";
declare namespace ns2 = "http://www.bea.com/wli/sb/context";(:ctx:)
declare namespace ns5 = "http://www.bea.com/wli/sb/stages/transform/config";(:con1:)
declare namespace ns6 = "http://BusinessEntityDataMediationModule/serviceExport/BusinessEntityDataInterface";(:in:)

declare function xf:PregledZahtevaErrorHandler($fault1 as element(ns1:fault))
    as element() {
        <ns0:CommonResponse>
         if(data($fault1/ns2:errorCode)='CRIS-S001')then(
        	<ns0:greska>
                <ns0:kod-greske>{ data($fault1/ns2:errorCode) }</ns0:kod-greske>
            	<ns0:opis-greske>{data($fault1/ns2:reason)}</ns0:opis-greske>
            	<ns0:inicijator-greske>Sintaksna greška.</ns0:inicijator-greske>
            </ns0:greska>
        )else(
        if(data($fault1/ns2:errorCode)='CRIS-S002')then(
        	<ns0:greska>
                <ns0:kod-greske>{ data($fault1/ns2:errorCode) }</ns0:kod-greske>
            	<ns0:opis-greske>{data($fault1/ns2:reason)}</ns0:opis-greske>
            	<ns0:inicijator-greske>Sintaksna greška.</ns0:inicijator-greske>
            </ns0:greska>
        ))
        </ns0:CommonResponse>
};

declare variable $fault1 as element(ns1:fault) external;

xf:PregledZahtevaErrorHandler($fault1)
