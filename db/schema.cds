using {
    cuid,
    managed
} from '@sap/cds/common';

namespace pwc.hand.ai2sap;

entity origin : cuid, managed {
    name           : String(60);
    content_origin : LargeString @UI.MultiLineText;
    content_target : LargeString @UI.MultiLineText;
    items          : Composition of many targetitem
                         on items.origin = $self;
}


entity targetitem : cuid, managed {
    origin      : Association to origin;
    FieldName   : String(60); // Name of the field
    KeyFlag     : String(1); // Indicates if the field is a key
    Obligatory  : String(1); // Indicates if the field is obligatory
    TableId     : String(60); // ID of the table
    FieldId     : String(60); // ID of the field
    DataType    : String(30); // Data type of the field
    Length      : Integer; // Length of the field
    Decimals    : Integer; // Number of decimal places
    Notes       : String(255); // Notes or comments about the field
    SampleValue : String(255); // Sample value for the field
// content     : LargeString @UI.MultiLineText;
}


