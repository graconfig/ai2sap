using ConvertService as service from '../../srv/convert';
annotate service.origin @(
    odata.draft.enabled,
    UI.Identification : [
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'ConvertService.convert',
            Label : 'convert',
        },
    ],
);
annotate service.origin with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : name,
            Label : 'name',
        },
        {
            $Type : 'UI.DataField',
            Value : content_origin,
            Label : 'content_origin',
        },
        {
            $Type : 'UI.DataField',
            Value : content_target,
            Label : 'content_target',
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'ConvertService.convert',
            Label : 'convert',
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
            Label : 'targetitem',
            ID : 'targetitem',
            Target : 'items/@UI.LineItem#targetitem',
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
                Value : content_origin,
                Label : '{i18n>Contentorigin}',
            },
            {
                $Type : 'UI.DataField',
                Value : content_target,
                Label : '{i18n>Contenttarget}',
            },
        ],
    },
);

annotate service.targetitem with @(
    UI.LineItem #targetitem : [
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

