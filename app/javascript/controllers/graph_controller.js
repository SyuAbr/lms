import {Controller} from "@hotwired/stimulus"
import cytoscape from 'cytoscape';

export default class extends Controller {
    static targets = ['container']

    connect() {
        const cy = cytoscape({
                container: this.containerTarget,
                elements: [
                    {data: {id: 'start'}},
                    {data: {id: 'koans'}},
                    {data: {id: 'rails quest 1'}},
                    {data: {id: 'gem: тема'}},
                    {data: {id: 'lab 1'}},
                    {data: {id: 'rails quest 2'}},
                    {data: {id: 'gem: репо'}},
                    {data: {id: 'rails quest 3'}},
                    {data: {id: 'gem: ревью'}},
                    {data: {id: 'edge1', source: 'start', target: 'koans'}},
                    {data: {id: 'edge2', source: 'start', target: 'rails quest 1'}},
                    {data: {id: 'edge3', source: 'start', target: 'gem: тема'}},
                    {data: {id: 'edge4', source: 'koans', target: 'lab 1'}},
                    {data: {id: 'edge5', source: 'rails quest 1', target: 'rails quest 2'}},
                    {data: {id: 'edge6', source: 'rails quest 2', target: 'rails quest 3'}},
                    {data: {id: 'edge7', source: 'gem: тема', target: 'gem: репо'}},
                    {data: {id: 'edge8', source: 'gem: репо', target: 'gem: ревью'}}
                ],
                style: [
                    {
                        selector: 'node',
                        style: {
                            'background-color': 'red',
                            'label': 'data(id)'
                        }
                    },
                    {
                        selector: 'edge',
                        style: {
                            'width': 3,
                            'line-color': 'blue'
                        }
                    }
                ]

            }
        )

    }
}
