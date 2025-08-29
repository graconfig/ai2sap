using {
    cuid,
    managed
} from '@sap/cds/common';

namespace pwc.hand.ai2sap;

entity input : cuid, managed {
    name    : String(60);
    content : LargeString @UI.MultiLineText;
}

entity output : cuid, managed {
    FieldName : String(60); // Name of the field
    KeyFlag   : String(1);  // Indicates if the field is a key
    Obligatory : String(1);  // Indicates if the field is obligatory
    TableId : String(60);    // ID of the table
    FieldId : String(60);    // ID of the field
    DataType : String(30);   // Data type of the field
    Length   : Integer;      // Length of the field
    Decimals : Integer;      // Number of decimal places
    Notes:      String(255); // Notes or comments about the field
    content     : LargeString @UI.MultiLineText;
}
