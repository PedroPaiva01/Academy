using {TaskService} from './task-service';

annotate TaskService.Tasks with @(UI: {
    Facets: [{
        $Type : 'UI.ReferenceFacet',
        Label : '{i18n>Task.title}',
        Target: '@UI.FieldGroup#Details'
    }],
    FieldGroup #Details: {
        Data: [
            {Value: title},
            {Value: description},
            {Value: priority},
            {Value: status},
            {Value: dueDate},
            {Value: assignedTo_ID, Label: '{i18n>Task.assignedTo}'}
        ]
    }
});

annotate TaskService.Users with @(UI: {
    LineItem        : [
        {
            Value               : username,
            Label               : '{i18n>User.username}',
        },
        {
            Value               : email,
            Label               : '{i18n>User.email}',
        }
    ],
    SelectionFields : [
        username,
        email
    ],
    Facets          : [{
        $Type : 'UI.ReferenceFacet',
        Label : '{i18n>User.ID}',
        Target: '@UI.FieldGroup#Nome'
    }, 
    {
        $Type : 'UI.ReferenceFacet',
        Label : '{i18n>User.tasks}',
        Target: 'tasks/@UI.LineItem'
    }, 
    ],
    FieldGroup #Nome: {Data: [{Value: username},{Value: email}]}
});
