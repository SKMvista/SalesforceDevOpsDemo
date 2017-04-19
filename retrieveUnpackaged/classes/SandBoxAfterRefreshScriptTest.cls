@isTest
class SandBoxAfterRefreshScriptTest {
    @isTest
    static void testSandboxPostCopyScript(){
        Test.testSandboxPostCopyScript(
                new SandBoxAfterRefreshScript(), 
                '00DW0000008xDvK', 
                '00D4D0000008mvw', 
                'MySandboxName'
            );
    }
}