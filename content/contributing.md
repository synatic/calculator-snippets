# Contributing

Contributing and development guidelines for calculator snippets. Most of the pertinent information is available in the [FAQ](faq.md), so be sure to read that content too. [Contributor Covenant](https://www.contributor-covenant.org/) rules apply.

## Adding content

Most of the content can bee added to an existing or new page in markdown format.

Copy the data in this template to create a new entry block:

````text

### Item heading

Item description

```javascript
// code comment

const content='Hello, world!';
```

#metadata, #careful, #hashtags-mustn't-be-headings

````

Once merged, this will create an entry like the one below:

### Item heading

Item description

```javascript
// code comment

const content='Hello, world!';
```

#metadata, #careful, #hashtags-mustn't-be-headings

---

## More Information

Check out the [FAQ](faq) and [Markdown](md) pages for more information on usage and styles.

## Development

This is mostly a simple collection of markdown documents that is rendered with [Docsify](https://docsify.js.org/#/). If you want to render your changes locally, check out the official [Quick start](https://docsify.js.org/#/quickstart) docs, or just install and serve the documentation with the docsify npm module from the content directory.

Really all you need is a server to launch `content/index.html`, which can be done with python:

```batch
python -m http.server --directory ./content/ --bind 127.0.0.1 3000
```

That should render the site at https://127.0.0.1:3000

Alternatively, you can use the docsify cli:

```bash
npm i docsify-cli
```

Then

```bash
npx docsify serve ./content
```

Or

```bash
cd ./content && npx docsify serve
```

Running docsify locally will of course require NodeJS to be installed.

On Windows, you can easily make a serve.cmd for double-click to run operations, e.g.

```batch
@echo off
cd %~dp0content
cmd /k "python -m http.server --bind 127.0.0.1 3000"
pause
```

or

```batch
@echo off
cd %~dp0content
python -m http.server --directory ./content/ --bind 127.0.0.1 3000
cmd /k "npx docsify serve"
pause
```
