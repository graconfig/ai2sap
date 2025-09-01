import { origin } from "#cds-models/ConvertService";

import cds from "@sap/cds";

export default class ChatService extends cds.ApplicationService {
  init() {
    const { convert } = origin.actions;

    this.on(convert, async (req) => {
      const [params]: any = req.params;
      const { IsActiveEntity } = params;

      const input = await SELECT.one.from(req.subject);



    });

    return super.init();
  }
}
