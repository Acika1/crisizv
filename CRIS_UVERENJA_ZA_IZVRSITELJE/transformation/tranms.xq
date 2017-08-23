(:: pragma bea:global-element-parameter parameter="$request1" element="ns0:Request" location="../wsdl/UverenjaOsiguranikaPS.wsdl" ::)
(:: pragma  parameter="$path" type="anyType" ::)
(:: pragma  parameter="$columnName" type="anyType" ::)
(:: pragma bea:local-element-return type="ns1:runReport/ns1:reportRequest" location="../wsdl/ReportService.wsdl" ::)

declare namespace ns1 = "http://xmlns.oracle.com/oxp/service/v2";
declare namespace ns0 = "http://cr.services/xsd";
declare namespace xf = "http://tempuri.org/CRIS_UVERENJA_ZA_IZVRSITELJE/transformation/tranms/";

declare function xf:tranms($request1 as element(ns0:Request),
    $path as element(*),
    $columnName as element(*))
    as element() {
        <ns1:reportRequest>
            <ns1:XDOPropertyList>
                <ns1:metaDataList>
                    <ns1:item>
                        <ns1:metaDataName>{ $columnName/@* , $columnName/node() }</ns1:metaDataName>
                        <ns1:metaDataValue>{ data($request1/ns0:id-detalja-zahteva) }</ns1:metaDataValue>
                    </ns1:item>
                </ns1:metaDataList>
            </ns1:XDOPropertyList>
            <ns1:reportAbsolutePath>{ $path/@* , $path/node() }</ns1:reportAbsolutePath>
        </ns1:reportRequest>
};

declare variable $request1 as element(ns0:Request) external;
declare variable $path as element(*) external;
declare variable $columnName as element(*) external;

xf:tranms($request1,
    $path,
    $columnName)
