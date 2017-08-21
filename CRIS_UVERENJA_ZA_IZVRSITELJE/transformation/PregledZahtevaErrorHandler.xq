(:: pragma bea:global-element-parameter parameter="$fault1" element="ns1:fault" location="../../CRIS_DATATYPES/xsd/http_soap/MessageContext.xsd" ::)
(:: pragma bea:local-element-return type="ns0:Response/ns0:CommonResponse" location="../wsdl/PregledZahteva.wsdl" ::)

declare namespace ns1 = "http://www.bea.com/wli/sb/context";
declare namespace ns0 = "http://cr.services/xsd";
declare namespace xf = "http://tempuri.org/CRIS_UVERENJA_ZA_IZVRSITELJE/transformation/PregledZahtevaErrorHandler/";

declare function xf:PregledZahtevaErrorHandler($fault1 as element(ns1:fault))
    as element() {
        <ns0:CommonResponse>
        
        </ns0:CommonResponse>
};

declare variable $fault1 as element(ns1:fault) external;

xf:PregledZahtevaErrorHandler($fault1)
