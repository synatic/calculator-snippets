# Markdown

Most of the content in this repo is stored and rendered from markdown content.

If you're not familiar with technical documentation practices, you might be wondering "Well what is markdown?". If that is the case, then this page should help you on your way to learning and using basic markdown syntax.

## What is MD

Markdown is a simple markup syntax that allows you to specify text styling in plain text. So by typing `**bold**` into a text document and rendering it as markdown, you can easily have styled text without a word processor.

Chances you already use a limited subset of markdown in messaging apps like whatsapp and telegram to make bold text and so on. It's not too complicated.

## Resources

- https://www.markdownguide.org/cheat-sheet
- https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github

## Considerations

Markdown is generally parsed into HTML, so you can use html directly in the markdown content too where needed (although there are sanitization and security implications, which inherently introduce limitations).

## Examples

Comparing markdown syntax with what you find in html and wordprocessors should illustrate it's general utility.

```plaintext
Styling Text in Markdown:
- **Bold**
- *Italic*
- ~~Strikethrough~~
```

Styling Text in Markdown:
- **Bold**
- *Italic*
- ~~Strikethrough~~

```html
Styling Text in HTML:
<ul>
    <li><b>Bold</b></li>
    <li><i>Italic</i></li>
    <li><s>Strikethrough</s></li>
</ul>
```

Styling Text in HTML:
<ul>
    <li><b>Bold</b></li>
    <li><i>Italic</i></li>
    <li><s>Strikethrough</s></li>
</ul>

See? Same result, but with much less effort.

---

### Codeblocks

A primary objective for markdown in the context of this site is for annotation and rendering **code blocks**.

Code is typically wrapped in a block with three backticks (use more if you want to use them as escape characters). Be sure to define the language in your codeblocks for extra features.

````plaintext
```javascript
let x=0;
if (x>=1) {
    console.log("yaaaaaaaaassssssss");
} else if (x==0) {
    console.log("Hello world");
} else if (x<0){
    console.log("Negative, lulz");
} else {
    console.log("NaNNaNNaNNaNNaNNaNNaNNaN");
}
```
````

Codeblocks allow for easy copypasta ops and offer syntax highlighting for improved readability.

```javascript
let x=0;
if (x>=1) {
    console.log("yaaaaaaaaassssssss");
} else if (x==0) {
    console.log("Hello world");
} else if (x<0){
    console.log("Negative, lulz");
} else {
    console.log("NaNNaNNaNNaNNaNNaNNaNNaN");
}
```

> Got it? Let's get some more examples into a quick cheatsheet to help new users.

Basic Markup Elements:

```plaintext
# h1

Heading Level 1

## h2

Heading Level 2

### h3

Heading Level 3

#### h4

Heading Level 4

##### h5

Heading Level 5. Did you notice how many of the headers get automatically turned into page anchor links?

### Tables

|left column|center column|right column|
|---|:---:|---:|
|Cell1|Cell2|Cell 3|

### Unordered List

- item 1
- item 2
- item 3

### Ordered List

1. item 1
2. item 2
3. item 3

### Auto-ordered List

1. item 1
1. item 2
1. item 3

### Blockquote

> The trouble with internet quotes is that you can never be sure of their validity - Abraham Lincoln

### Inline code

Using code `inline` will allow you to escape special characters as well, like identifying `**bold text**`.

### Horizontal Rule

---

```

Results in:

# h1

Heading Level 1

## h2

Heading Level 2

### h3

Heading Level 3

#### h4

Heading Level 4

##### h5

Heading Level 5. Did you notice how many of the headers get automatically turned into page anchor links?

### Tables

|left column|center column|right column|
|---|:---:|---:|
|Cell1|Cell2|Cell 3|

### Unordered List

- item 1
- item 2
- item 3

### Ordered List

1. item 1
2. item 2
3. item 3

### Auto-ordered List

1. item 1
1. item 2
1. item 3

### Blockquote

> The trouble with internet quotes is that you can never be sure of their validity - Abraham Lincoln

### Inline code

Using code `inline` will allow you to escape special characters as well, like identifying `**bold text**`.

### Horizontal Rule

---
