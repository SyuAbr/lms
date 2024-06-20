import { Controller } from "@hotwired/stimulus"
import mermaid from 'mermaid'

export default class extends Controller {
    static targets = ['diagram']

    connect() {
        mermaid.initialize({ startOnLoad: true });
        this.setupClickHandler();
    }

    setupClickHandler() {
        this.diagramTargets.forEach((diagram) => {
            diagram.addEventListener('click', (event) => {
                if (event.target.tagName === 'text' || event.target.closest('g')) {
                    const nodeName = event.target.textContent;
                    const userId = this.data.get('userId');
                    const url = this.generateUrl(nodeName, userId);
                    window.location.href = url;
                }
            });
        });
    }

    generateUrl(nodeName, userId) {
        return `/mermaid/${userId}/${nodeName.replace(/\s+/g, '-').toLowerCase()}`;
    }
}
