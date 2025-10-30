sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"front2/test/integration/pages/TasksList",
	"front2/test/integration/pages/TasksObjectPage"
], function (JourneyRunner, TasksList, TasksObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('front2') + '/test/flpSandbox.html#front2-tile',
        pages: {
			onTheTasksList: TasksList,
			onTheTasksObjectPage: TasksObjectPage
        },
        async: true
    });

    return runner;
});

