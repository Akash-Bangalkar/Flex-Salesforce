@IsTest global with sharing class TestDemoClass1Test {
    @IsTest(SeeAllData=true) global static void testTestDemoClass1 () {
        TestDemoClass1 cls = new TestDemoClass1 ();
        System.assertEquals('', '');
    }
}