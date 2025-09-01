sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'convert/test/integration/FirstJourney',
		'convert/test/integration/pages/originList',
		'convert/test/integration/pages/originObjectPage',
		'convert/test/integration/pages/targetitemObjectPage'
    ],
    function(JourneyRunner, opaJourney, originList, originObjectPage, targetitemObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('convert') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheoriginList: originList,
					onTheoriginObjectPage: originObjectPage,
					onThetargetitemObjectPage: targetitemObjectPage
                }
            },
            opaJourney.run
        );
    }
);