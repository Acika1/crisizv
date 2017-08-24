(:: pragma bea:global-element-parameter parameter="$cmZahtevZaglavljeCollection1" element="ns1:CmZahtevZaglavljeCollection" location="../adapter/UverenjaZaIzvrsiteljeReport/xsd/PregledZahtevaIzvrsitelja_table.xsd" ::)
(:: pragma bea:global-element-return element="ns0:Response" location="../wsdl/PregledZahteva.wsdl" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/top/PregledZahtevaIzvrsitelja";
declare namespace ns0 = "http://cr.services/xsd";
declare namespace xf = "http://tempuri.org/CRIS_UVERENJA_ZA_IZVRSITELJE/transformation/PregledZahtevaFromDb/";

declare function xf:PregledZahtevaFromDb($cmZahtevZaglavljeCollection1 as element(ns1:CmZahtevZaglavljeCollection))
    as element(ns0:Response) {
        <ns0:Response>
            {
                for $CmZahtevZaglavlje in $cmZahtevZaglavljeCollection1/ns1:CmZahtevZaglavlje
                return
                    <ns0:ZaglavljeZahtevaIzvrsitelja>
                        <ns0:id-zaglavlje>{ data(xs:int($CmZahtevZaglavlje/ns1:cmZzaId)) }</ns0:id-zaglavlje>
                        <ns0:jmbg-izvrsitelja>{ data($CmZahtevZaglavlje/ns1:cmJmbgIzvrsitelja) }</ns0:jmbg-izvrsitelja>
                        <ns0:ime-prezime-izvrsitelja>{ data($CmZahtevZaglavlje/ns1:cmImePrezime) }</ns0:ime-prezime-izvrsitelja>
                        <ns0:cm-datum>{ data(xs:date($CmZahtevZaglavlje/ns1:cmDatum)) }</ns0:cm-datum>
                        {
                            let $cmZahtevDetaljiCollection := $CmZahtevZaglavlje/ns1:cmZahtevDetaljiCollection
                            return
                                <ns0:DetaljiZahtevaOsiguranikaCollection>
                                    {
                                        for $CmZahtevDetalji in $cmZahtevDetaljiCollection/ns1:CmZahtevDetalji
                                        return
                                            <ns0:DetaljiZahtevaOsiguranika>
                                                <ns0:id-detalji>{ xs:int($CmZahtevDetalji/ns1:cmZdtId) }</ns0:id-detalji>
                                                <ns0:jmbg-osiguranika>{ data($CmZahtevDetalji/ns1:cmJmbg) }</ns0:jmbg-osiguranika>
                                                <ns0:ime-osiguranika>{ data($CmZahtevDetalji/ns1:cmIme) }</ns0:ime-osiguranika>
                                                <ns0:prezime-osiguranika>{ data($CmZahtevDetalji/ns1:cmPrezime) }</ns0:prezime-osiguranika>
                                            </ns0:DetaljiZahtevaOsiguranika>
                                    }
                                </ns0:DetaljiZahtevaOsiguranikaCollection>
                        }
                    </ns0:ZaglavljeZahtevaIzvrsitelja>
            }
        </ns0:Response>
};

declare variable $cmZahtevZaglavljeCollection1 as element(ns1:CmZahtevZaglavljeCollection) external;

xf:PregledZahtevaFromDb($cmZahtevZaglavljeCollection1)
