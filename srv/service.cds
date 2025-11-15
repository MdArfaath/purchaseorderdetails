

using { ust.arfaath.shaik.datamodel.master as a, ust.arfaath.shaik.datamodel.transaction as b } from '../db/datamodel';

service MasterService {
    entity BusinessPartners as projection on a.businesspartner;
    entity Addresses as projection on a.address;
    entity Products as projection on a.product;
}

service TransactionService {
    @Capabilities : { Insertable: True, Updatable: True, Deletable: True }
    @odata.draft.enabled

    @UI.SelectionFields  : [PO_ID, OVERALL_STATUS]
    
    @UI.HeaderInfo : {
        TypeName : 'Purchase Order',
        TypeNamePlural : 'Purchase Orders',
        Title : {Value: PARTNER_GUID},
        Description : {Value: LIFECYCLE_STATUS}
    }

    @UI.LineItem : [
        {Value : PO_ID, Label: '{i18n>PurchaseOrderID}'},
        {Value : NODE_KEY, Label: '{i18n>NodeKey}'},
        {Value : LIFECYCLE_STATUS, Label: '{i18n>LifecycleStatus}'},
        {Value : OVERALL_STATUS, Label: '{i18n>OverallStatus}'}
    ]

    @UI.Identification : [
        {Value : PO_ID, Label: 'Purchase Order ID'},
        {Value : PARTNER_GUID_NODE_KEY, Label: 'Business Partner'},
        {Value : LIFECYCLE_STATUS, Label: 'Lifecycle Status'},
        {Value : OVERALL_STATUS, Label: 'Overall Status'}
    ]

    @UI.FieldGroup : {
        Label : 'PO Details',

        Data : [
            {Value : CURRENCY_code, Label: 'Currency Code'},
            {Value : GROSS_AMOUNT, Label: 'Gross Amount'},
            {Value : NET_AMOUNT, Label: 'Net Amount'},
            {Value : TAX_AMOUNT, Label: 'Tax Amount'}
        ]
    }

    @UI.Facets : [
        {$Type : 'UI.ReferenceFacet', Label : 'General Information', Target : '@UI.Identification'},
        {$Type : 'UI.ReferenceFacet', Label : 'Purchase Order Items', Target : '@UI.FieldGroup'}
    ]
    entity PurchaseOrders as projection on b.purchaseorder;
    entity PurchaseOrderItems as projection on b.poitems;
}
