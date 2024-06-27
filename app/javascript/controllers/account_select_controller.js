import { Controller } from "@hotwired/stimulus";
import { Turbo } from "@hotwired/turbo-rails";

// Connects to data-controller="account-select"
export default class extends Controller {
  static targets = ["select"];

  connect() {
    this.selectTarget.addEventListener("change", this.redirect.bind(this));
    this.setInitialSelection();
  }

  setInitialSelection() {
    const accountId = this.data.get("selectedAccountId");
    if (accountId) {
      this.selectTarget.value = accountId;
    }
  }

  redirect() {
    const accountId = this.selectTarget.value;
    if (accountId) {
      Turbo.visit(`/customer-portal/accounts/${accountId}`);
    }
  }
}
