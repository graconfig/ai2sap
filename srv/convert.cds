using {pwc.hand.ai2sap as db} from '../db/schema';


service ConvertService @(path: '/ai2sap') {
    @cds.query.limit.max    : 1000
    @cds.query.limit.default: 100
    entity origin       as projection on db.origin
        actions {
            action convert() returns Boolean;
        };
    entity targetitem  as projection on db.targetitem;
}
