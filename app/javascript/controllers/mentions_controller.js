import { Controller } from "@hotwired/stimulus";
import Tribute from "tributejs";
import { get } from "@rails/request.js";

// Connects to data-controller="mentions"
export default class extends Controller {
  connect() {
    this.tribute = new Tribute({
      values: async (text, cb) => {
        if (text.length > 0) {
          const response = await get(`/users.json?query=${text}`);
          if (response.ok) {
            const users = await response.json;
            cb(
              users.map((user) => ({
                key: `${user.first_name} ${user.last_name}`,
                value: user.username,
              }))
            );
          }
        } else {
          cb([]);
        }
      },
      // Allows matching of words even if there's punctuation immediately after the trigger character
      noMatchTemplate: () => "",
    });
    this.tribute.attach(this.element);
  }
}
