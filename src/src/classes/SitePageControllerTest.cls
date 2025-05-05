@IsTest public with sharing class SitePageControllerTest {
    @IsTest(SeeAllData=true) static void testSitePageController () {
        SitePageController controller = new SitePageController ();
        System.assertNotEquals(controller, null);
        System.assertEquals(controller.updateValue(), null);
    }
}