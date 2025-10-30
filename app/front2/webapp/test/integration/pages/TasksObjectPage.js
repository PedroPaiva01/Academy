sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'front2',
            componentId: 'TasksObjectPage',
            contextPath: '/Tasks'
        },
        CustomPageDefinitions
    );
});