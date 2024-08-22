import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    const trixContents = document.querySelectorAll(".trix-content");
    trixContents.forEach((content) => {
      const textNodes = this.getTextNodes(content);
      console.log(textNodes);
      textNodes.forEach((node) => {
        const urlRegex = /(https?:\/\/[^\s<>"',]+)/g;

        if (urlRegex.test(node.textContent)) {
          const html = node.textContent.replace(urlRegex, function (url) {
            return `<a href="${url}" target="_blank">${url}</a>`;
          });

          const tempDiv = document.createElement("div");
          tempDiv.innerHTML = html;

          while (tempDiv.firstChild) {
            node.parentNode.insertBefore(tempDiv.firstChild, node);
          }

          node.parentNode.removeChild(node);
        }
      });
    });
  }

  getTextNodes(node) {
    let textNodes = [];
    const treeWalker = document.createTreeWalker(
      node,
      NodeFilter.SHOW_TEXT,
      null,
      false
    );
    let currentNode = treeWalker.nextNode();

    while (currentNode) {
      textNodes.push(currentNode);
      currentNode = treeWalker.nextNode();
    }

    return textNodes;
  }
}
