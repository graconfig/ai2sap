using {pwc.hand.ai2sap as db} from '../db/schema';


service ConvertService @(path: '/ai2sap') {
    @cds.query.limit.max    : 1000
    @cds.query.limit.default: 100
    entity head       as projection on db.head
        actions {
            action convert() returns Boolean;
        };

    entity input      as projection on db.input;
    entity output     as projection on db.output;

    entity outputitem as projection on db.outputitem
}
