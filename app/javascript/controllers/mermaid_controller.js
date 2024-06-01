import { Controller } from "@hotwired/stimulus"
import mermaid from 'mermaid'
export default class extends Controller {
    static targets = ['diagram']
    connect() {
        mermaid.initialize({ startOnLoad: true });
    }

}
