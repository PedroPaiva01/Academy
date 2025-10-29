sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"front1/test/integration/pages/UsersList",
	"front1/test/integration/pages/UsersObjectPage",
	"front1/test/integration/pages/TasksObjectPage"
], function (JourneyRunner, UsersList, UsersObjectPage, TasksObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('front1') + '/test/flpSandbox.html#front1-tile',
        pages: {
			onTheUsersList: UsersList,
			onTheUsersObjectPage: UsersObjectPage,
			onTheTasksObjectPage: TasksObjectPage
        },
        async: true
    });

    return runner;
});

