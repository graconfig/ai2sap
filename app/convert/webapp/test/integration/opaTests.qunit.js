sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'convert/test/integration/FirstJourney',
		'convert/test/integration/pages/headList',
		'convert/test/integration/pages/headObjectPage',
		'convert/test/integration/pages/inputObjectPage'
    ],
    function(JourneyRunner, opaJourney, headList, headObjectPage, inputObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('convert') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheheadList: headList,
					onTheheadObjectPage: headObjectPage,
					onTheinputObjectPage: inputObjectPage
                }
            },
            opaJourney.run
        );
    }
);