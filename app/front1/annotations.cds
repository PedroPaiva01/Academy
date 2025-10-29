using TaskService as service from '../../srv/task-service';

annotate service.Tasks with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : title,
            Label : '{i18n>Task.title}',
        },
        {
            $Type : 'UI.DataField',
            Value : description,
            Label : '{i18n>Task.description}',
        },
        {
            $Type : 'UI.DataField',
            Value : status,
            Label : '{i18n>Task.status}',
            Criticality : {$edmJson: {$If: [
                {$Eq: [
                    {$Path: 'status'},
                    'New'
                ]},
                'UI.CriticalityType/Negative', // Red for 'New'
                {$If: [
                    {$Eq: [
                        {$Path: 'status'},
                        'InProgress'
                    ]},
                    'UI.CriticalityType/Critical', // Orange for 'InProgress'
                    'UI.CriticalityType/Positive'  // Green for 'Done'
                ]}
            ]}}
        },
        {
            $Type : 'UI.DataField',
            Value : priority,
            Label : '{i18n>Task.priority}',
        },
        {
            $Type : 'UI.DataField',
            Value : assignedTo_ID,
        },
        {
            $Type : 'UI.DataField',
            Value : dueDate,
            Label : '{i18n>Task.dueDate}',
        },
    ],
    Facets         : [{
        $Type : 'UI.ReferenceFacet',
        Label : '{i18n>Task.details}',
        Target: '@UI.FieldGroup#Details'
    }],
    FieldGroup #Details: {Data: [
        {Value: title},
        {Value: description},
        {Value: priority},
        {Value: status},
        {Value: dueDate},
        {
            Value: assignedTo_ID,
            Label: '{i18n>Task.assignedTo}'
        },
    ]}
);

annotate service.Tasks with {
    assignedTo @(
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Users',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : assignedTo_ID,
                    ValueListProperty : 'ID',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'username',
                },
            ],
        },
)};