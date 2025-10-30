using TaskService as service from '../../srv/task-service';
annotate service.Tasks with @(
    UI.HeaderInfo : {
        Title : {
            $Type : 'UI.DataField',
            Value : title,
        },
        TypeName : '',
        TypeNamePlural : '',
    },
    UI.SelectionFields : [
        assignedTo.username,
        status,
    ],
);

