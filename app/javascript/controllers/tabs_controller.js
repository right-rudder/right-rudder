import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  activate(event) {
    let tabs = [...document.getElementsByClassName("tab")];

    tabs.forEach((element) => {
      element.classList.remove("bg-white");
    });
    event.target.classList.add("bg-white");
  }
}
