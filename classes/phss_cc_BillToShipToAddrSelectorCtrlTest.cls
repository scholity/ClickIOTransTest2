/**
 * Created by dgajwani on 12/4/18.
 */
@isTest
public with sharing class phss_cc_BillToShipToAddrSelectorCtrlTest {

    public static Map<String, Object> testData;
    public static Opportunity testOpportunity;
    public static ccrz__E_ContactAddr__c testContactAddress;

    public static void setupTestData(){
        testData = phss_cc_TestDataFactory.setupAccountAndProducts();
        testOpportunity = phss_cc_TestDataFactory.createInsertTestOpportunity((Account) testData.get(phss_cc_TestDataFactory.TEST_ACCOUNT));
        testContactAddress = phss_cc_TestDataFactory.createInsertTestContactAddress();
        phss_cc_TestDataFactory.createInsertTestAccountAddressBook((Account) testData.get(phss_cc_TestDataFactory.TEST_ACCOUNT), testContactAddress);
    }

    @isTest
    public static void testFetchAddresses(){

        setupTestData();

        Test.startTest();
        Map<String, Object> fetchAddressesResponse = phss_cc_BillToShipToAddressSelectorCtrl.fetchAddresses(null,null);
        fetchAddressesResponse = phss_cc_BillToShipToAddressSelectorCtrl.fetchAddresses(testOpportunity.Id, '');
        Test.stopTest();
    }

    @isTest
    public static void testAddAddressToCart(){

        setupTestData();
        phss_cc_TestDataFactory.createInsertCartAndCartItems(1,testData,testOpportunity.Id);
        ccrz__E_ContactAddr__c testShippingAddress = phss_cc_TestDataFactory.createInsertTestContactAddress();

        Test.startTest();
        Map<String, Object> addAddressToCartResponse = phss_cc_BillToShipToAddressSelectorCtrl.addAddressToCart(null,null,null);
        addAddressToCartResponse = phss_cc_BillToShipToAddressSelectorCtrl.addAddressToCart(testOpportunity.Id,'Billing',testShippingAddress.Id);
        Test.stopTest();
    }

    @isTest
    public static void testGetCurrentAddressesFromCart(){

        setupTestData();
        List<ccrz__E_Cart__c> mycarts = phss_cc_TestDataFactory.createInsertCartAndCartItems(1,testData,testOpportunity.Id);
        ccrz__E_ContactAddr__c testShippingAddress = phss_cc_TestDataFactory.createInsertTestContactAddress();
        phss_cc_TestDataFactory.addAddressToCart(mycarts[0],testShippingAddress.Id, 'Shipping');

        Test.startTest();
        Map<String, Object> getCurrentAddressesFromCartResponse = phss_cc_BillToShipToAddressSelectorCtrl.getCurrentAddressesFromCart(null);
        getCurrentAddressesFromCartResponse = phss_cc_BillToShipToAddressSelectorCtrl.getCurrentAddressesFromCart(testOpportunity.Id);
        Test.stopTest();
    }

}