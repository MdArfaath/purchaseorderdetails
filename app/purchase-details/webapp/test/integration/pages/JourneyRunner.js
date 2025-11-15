sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"com/ust/purchaseorderdetails/purchasedetails/test/integration/pages/PurchaseOrdersList",
	"com/ust/purchaseorderdetails/purchasedetails/test/integration/pages/PurchaseOrdersObjectPage",
	"com/ust/purchaseorderdetails/purchasedetails/test/integration/pages/PurchaseOrderItemsObjectPage"
], function (JourneyRunner, PurchaseOrdersList, PurchaseOrdersObjectPage, PurchaseOrderItemsObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('com/ust/purchaseorderdetails/purchasedetails') + '/test/flp.html#app-preview',
        pages: {
			onThePurchaseOrdersList: PurchaseOrdersList,
			onThePurchaseOrdersObjectPage: PurchaseOrdersObjectPage,
			onThePurchaseOrderItemsObjectPage: PurchaseOrderItemsObjectPage
        },
        async: true
    });

    return runner;
});

