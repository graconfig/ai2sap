using {pwc.hand.ai2sap as db} from '../db/schema';


service ConvertService @(path: '/ai2sap') {

    @cds.query.limit.max    : 1000
    @cds.query.limit.default: 100
    entity input  as projection on db.input
        actions {
            action convert() returns Boolean;
        };

    @cds.query.limit.max    : 1000
    @cds.query.limit.default: 100
    entity output as projection on db.output
}
