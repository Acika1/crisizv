(:: pragma bea:global-element-parameter parameter="$request1" element="ns0:Request" location="../wsdl/PregledZahteva.wsdl" ::)
(:: pragma bea:global-element-return element="ns1:PregledZahtevaIzvrsiteljaSelect_jmbgIzvrsitelja_datumInputParameters" location="../adapter/UverenjaZaIzvrsiteljeReport/xsd/PregledZahtevaIzvrsitelja_table.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/top/PregledZahtevaIzvrsitelja";
declare namespace ns0 = "http://cr.services/xsd";
declare namespace xf = "http://tempuri.org/CRIS_UVERENJA_ZA_IZVRSITELJE/transformation/PregledZahtevaToDb/";

declare function xf:PregledZahtevaToDb($request1 as element(ns0:Request))
    as element(ns1:PregledZahtevaIzvrsiteljaSelect_jmbgIzvrsitelja_datumInputParameters) {
        <ns1:PregledZahtevaIzvrsiteljaSelect_jmbgIzvrsitelja_datumInputParameters>
            <ns1:jmbgIzvrsitelja>{ data($request1/ns0:jmbg-izvrsitelja) }</ns1:jmbgIzvrsitelja>
            <ns1:datum>{ xs:string($request1/ns0:datum) }</ns1:datum>
        </ns1:PregledZahtevaIzvrsiteljaSelect_jmbgIzvrsitelja_datumInputParameters>
};

declare variable $request1 as element(ns0:Request) external;

xf:PregledZahtevaToDb($request1)
