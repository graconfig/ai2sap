using ConvertService as service from '../../srv/convert';

annotate ConvertService.head @(
    odata.draft.enabled,
    UI.Identification : [
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'ConvertService.convert',
            Label : 'convert',
        },
    ],
);
annotate service.head with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>Input}',
            ID : 'i18nInput',
            Target : 'inputs/@UI.LineItem#i18nInput',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>Output}',
            ID : 'i18nOutput',
            Target : 'outputs/@UI.LineItem#i18nOutput',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : ID,
            Label : 'ID',
        },
        {
            $Type : 'UI.DataField',
            Value : createdBy,
        },
        {
            $Type : 'UI.DataField',
            Value : createdAt,
        },
    ],
) actions {
    @Common.SideEffects: {TargetEntities: ['in/output']}
    convert;
};

annotate service.input with @(
    UI.LineItem #i18nInput : [
        {
            $Type : 'UI.DataField',
            Value : name,
            Label : 'name',
        },
        {
            $Type : 'UI.DataField',
            Value : content,
            Label : 'content',
        },
    ]
);

annotate service.output with @(
    UI.LineItem #i18nOutput : [
        {
            $Type : 'UI.DataField',
            Value : name,
            Label : 'name',
        },
        {
            $Type : 'UI.DataField',
            Value : content,
            Label : 'content',
        },
    ],
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>Basic}',
            ID : 'i18nBasic',
            Target : '@UI.FieldGroup#i18nBasic',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>Items}',
            ID : 'i18nItems',
            Target : 'items/@UI.LineItem#i18nItems',
        },
    ],
    UI.FieldGroup #i18nBasic : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : name,
                Label : 'name',
            },
            {
                $Type : 'UI.DataField',
                Value : content,
                Label : 'content',
            },
        ],
    },
);

annotate service.outputitem with @(
    UI.LineItem #i18nItems : [
        {
            $Type : 'UI.DataField',
            Value : FieldName,
            Label : 'FieldName',
        },
        {
            $Type : 'UI.DataField',
            Value : KeyFlag,
            Label : 'KeyFlag',
        },
        {
            $Type : 'UI.DataField',
            Value : Obligatory,
            Label : 'Obligatory',
        },
        {
            $Type : 'UI.DataField',
            Value : TableId,
            Label : 'TableId',
        },
        {
            $Type : 'UI.DataField',
            Value : FieldId,
            Label : 'FieldId',
        },
        {
            $Type : 'UI.DataField',
            Value : DataType,
            Label : 'DataType',
        },
        {
            $Type : 'UI.DataField',
            Value : Length,
            Label : 'Length',
        },
        {
            $Type : 'UI.DataField',
            Value : Decimals,
            Label : 'Decimals',
        },
        {
            $Type : 'UI.DataField',
            Value : Notes,
            Label : 'Notes',
        },
        {
            $Type : 'UI.DataField',
            Value : SampleValue,
            Label : 'SampleValue',
        },
    ]
);

annotate service.outputitem with {
    FieldName @Common.FieldControl : #ReadOnly
};

annotate service.outputitem with {
    KeyFlag @Common.FieldControl : #ReadOnly
};

annotate service.outputitem with {
    Obligatory @Common.FieldControl : #ReadOnly
};

annotate service.outputitem with {
    TableId @Common.FieldControl : #ReadOnly
};

annotate service.outputitem with {
    FieldId @Common.FieldControl : #ReadOnly
};

annotate service.outputitem with {
    DataType @Common.FieldControl : #ReadOnly
};

annotate service.outputitem with {
    Length @Common.FieldControl : #ReadOnly
};

annotate service.outputitem with {
    Decimals @Common.FieldControl : #ReadOnly
};

annotate service.outputitem with {
    Notes @Common.FieldControl : #ReadOnly
};

annotate service.outputitem with {
    SampleValue @Common.FieldControl : #ReadOnly
};

