import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = [
    "menu",
    "menuBackdrop",
    "sidemenu1",
    "sidemenu2",
    "sidemenu3",
    "closeButton",
  ];

  close() {
    this.menuBackdropTarget.classList.add("opacity-0");
    this.menuBackdropTarget.classList.remove("opacity-100");
    this.sidemenu1Target.classList.add("-translate-x-full");
    this.sidemenu1Target.classList.remove("translate-x-0");
    this.sidemenu2Target.classList.add("-translate-x-full");
    this.sidemenu2Target.classList.remove("translate-x-0");
    this.sidemenu3Target.classList.add("-translate-x-full");
    this.sidemenu3Target.classList.remove("translate-x-0");
    this.closeButtonTarget.classList.add("opacity-0");
    this.closeButtonTarget.classList.remove("opacity-100");
  }

  open() {
    this.menuBackdropTarget.classList.remove("opacity-0");
    this.menuBackdropTarget.classList.add("opacity-100");
    this.sidemenu1Target.classList.remove("-translate-x-full");
    this.sidemenu1Target.classList.add("translate-x-0");
    this.sidemenu2Target.classList.remove("-translate-x-full");
    this.sidemenu2Target.classList.add("translate-x-0");
    this.sidemenu3Target.classList.remove("-translate-x-full");
    this.sidemenu3Target.classList.add("translate-x-0");
    this.closeButtonTarget.classList.remove("opacity-0");
    this.closeButtonTarget.classList.add("opacity-100");
  }
}
