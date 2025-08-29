using {
    cuid,
    managed
} from '@sap/cds/common';

namespace pwc.hand.ai2sap;

entity head : cuid, managed {
    inputs  : Composition of many input
                  on inputs.head = $self;
    outputs : Composition of many output
                  on outputs.head = $self;
}

entity input : cuid, managed {
    head    : Association to head;
    name    : String(60);
    content : LargeString @UI.MultiLineText;
}

entity output : cuid, managed {
    head    : Association to head;
    name    : String(60);
    content : LargeString @UI.MultiLineText;
    items   : Composition of many outputitem
                  on items.output = $self;
}

entity outputitem : cuid, managed {
    output      : Association to output;
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
