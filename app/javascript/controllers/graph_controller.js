import { Controller } from "@hotwired/stimulus";
import cytoscape from 'cytoscape';
import dagre from 'cytoscape-dagre';
export default class extends Controller {
    static targets = ['container'];

    connect() {
        cytoscape.use(dagre);

        const cy = cytoscape({
            container: this.containerTarget,
            elements: [
                { data: { id: 'start', label: 'Start', href: '/start' } },
                { data: { id: 'koans', label: 'Koans', href: '/koans' } },
                { data: { id: 'rails quest 1', label: 'Rails Quest 1', href: '/rails-quest-1' } },
                { data: { id: 'gem: тема', label: 'Gem: Тема', href: '/gem-theme' } },
                { data: { id: 'lab 1', label: 'Lab 1', href: '/lab-1' } },
                { data: { id: 'rails quest 2', label: 'Rails Quest 2', href: '/rails-quest-2' } },
                { data: { id: 'gem: репо', label: 'Gem: Репо', href: '/gem-repo' } },
                { data: { id: 'rails quest 3', label: 'Rails Quest 3', href: '/rails-quest-3' } },
                { data: { id: 'gem: ревью', label: 'Gem: Ревью', href: '/gem-review' } },
                { data: { id: 'edge1', source: 'start', target: 'koans' } },
                { data: { id: 'edge2', source: 'start', target: 'rails quest 1' } },
                { data: { id: 'edge3', source: 'start', target: 'gem: тема' } },
                { data: { id: 'edge4', source: 'koans', target: 'lab 1' } },
                { data: { id: 'edge5', source: 'rails quest 1', target: 'rails quest 2' } },
                { data: { id: 'edge6', source: 'rails quest 2', target: 'rails quest 3' } },
                { data: { id: 'edge7', source: 'gem: тема', target: 'gem: репо' } },
                { data: { id: 'edge8', source: 'gem: репо', target: 'gem: ревью' } },
            ],
            style: [
                {
                    selector: 'node',
                    style: {
                        'label': 'data(label)',
                        'text-valign': 'center',
                        'text-halign': 'center',
                        'font-size': '14px',
                        'background-color': '#0074D9',
                        'color': '#FFFFFF',
                        'width': '100px',
                        'height': '40px',
                        'shape': 'rectangle'
                    }
                },
                {
                    selector: 'edge',
                    style: {
                        'curve-style': 'bezier',
                        'target-arrow-shape': 'triangle',
                        'width': 2,
                        'line-color': '#C7C7C7',
                        'target-arrow-color': '#C7C7C7'
                    }
                }
            ]
        });

        cy.layout({
            name: 'dagre',
            nodeDimensionsIncludeLabels: true
        }).run();

        this.addClickHandler(cy);
    }

    addClickHandler(cy) {
        cy.on('tap', 'node', function(evt) {
            var node = evt.target;
            var href = node.data('href');
            if (href) {
                window.location.href = href;
            }
        });
    }

    changeButtonColor() {
        const button = document.getElementById('cy');
        if (button) {
            const state = this.containerTarget.querySelector('[data-id="start"]').getAttribute('data-state');
            if (state === 'completed') {
                button.style.backgroundColor = '#2ECC71';
            } else if (state === 'open') {
                button.style.backgroundColor = '#E74C3C';
            } else {
                button.style.backgroundColor = '#A9A9A9';
            }
        }
    }

    get containerTarget() {
        return this.targets.find('container');
    }
}
