const Markdoc = require('@markdoc/markdoc')

const tags = {};

function markdocRender(doc) {
  const ast = Markdoc.parse(doc);
  const content = Markdoc.transform(ast, { tags });
  return Markdoc.renderers.html(content);
}

globalThis.markdocRender = markdocRender;

// is this thing on?
console.log(markdocRender(`
# Testing 1.2.3.

- bang 💥
`))
