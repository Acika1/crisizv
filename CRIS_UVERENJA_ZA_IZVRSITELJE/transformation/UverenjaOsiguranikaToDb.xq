(:: pragma bea:global-element-parameter parameter="$request1" element="ns1:Request" location="../wsdl/UverenjaOsiguranikaPS.wsdl" ::)
(:: pragma bea:global-element-return element="ns0:GetIdDetaljaSelect_idDetaljaInputParameters" location="../adapter/AdapterIdDetalja/xsd/GetIdDetalja_table.xsd" ::)

declare namespace ns1 = "http://cr.services/xsd";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/top/GetIdDetalja";
declare namespace xf = "http://tempuri.org/CRIS_UVERENJA_ZA_IZVRSITELJE/transformation/UverenjaOsiguranikaToDb/";

declare function xf:UverenjaOsiguranikaToDb($request1 as element(ns1:Request))
    as element(ns0:GetIdDetaljaSelect_idDetaljaInputParameters) {
        <ns0:GetIdDetaljaSelect_idDetaljaInputParameters>
            <ns0:idDetalja>{ data($request1/ns1:id-detalja-zahteva) }</ns0:idDetalja>
        </ns0:GetIdDetaljaSelect_idDetaljaInputParameters>
};

declare variable $request1 as element(ns1:Request) external;

xf:UverenjaOsiguranikaToDb($request1)
