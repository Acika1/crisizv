(:: pragma bea:global-element-parameter parameter="$request1" element="ns0:Request" location="../wsdl/PregledZahteva.wsdl" ::)
(:: pragma bea:global-element-return element="ns0:Request" location="../wsdl/PregledZahteva.wsdl" ::)

declare namespace ns0 = "http://cr.services/xsd";
declare namespace xf = "http://tempuri.org/CRIS_UVERENJA_ZA_IZVRSITELJE/transformation/ValidateZahteviIzvrsitelja/";

declare function xf:ValidateZahteviIzvrsitelja($request1 as element(ns0:Request))
    as element(ns0:Request) {
        <ns0:Request>
            <ns0:jmbg-izvrsitelja>{ data($request1/ns0:jmbg-izvrsitelja) }</ns0:jmbg-izvrsitelja>
            {
                for $datum in $request1/ns0:datum
                return
                    <ns0:datum>{ data($datum) }</ns0:datum>
            }
        </ns0:Request>
};

declare variable $request1 as element(ns0:Request) external;

xf:ValidateZahteviIzvrsitelja($request1)