import { html, css, LitElement } from 'lit';
import {customElement} from 'lit/decorators.js';

@customElement('markdoc-callout')
export class MarkdocCallout extends LitElement {
  static styles = css`
    .note {
      background-color: #8792a2;
    }
    .caution {
      background-color: #d97917;
    }
    .check {
      background-color: #000000;
    }
    .warning {
      background-color: #ffd848;
    }
  `;

  static properties = {
    type: { type: String },
    title: { type: String }
  };

  constructor() {
    console.log("callout is called")
    super();
    this.type = 'note';
  }

  render() {
    return html`<p class="${this.type}"><strong>${this.title}</strong><slot></slot></p>`;
  }
}

