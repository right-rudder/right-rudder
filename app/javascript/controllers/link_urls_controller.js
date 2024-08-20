import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    const trixContents = document.querySelectorAll(".trix-content");
    trixContents.forEach((content) => {
      const innerDiv = content.querySelector("div");

      if (innerDiv) {
        let innerHTML = innerDiv.innerHTML;
        const urlRegex = /(\bhttps?:\/\/[^\s<>"',]+)/g;

        innerHTML = innerHTML.replace(urlRegex, function (url) {
          url = url.replace(/&nbsp;$/, "").trim();
          return `<a href="${url}" target="_blank">${url}</a>`;
        });
        innerDiv.innerHTML = innerHTML;

        const links = innerDiv.querySelectorAll("a");
        links.forEach((link) => {
          if (link.getAttribute("target") !== "_blank") {
            link.setAttribute("target", "_blank");
          }
        });
      }
    });
  }
}
