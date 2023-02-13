# FAQ

Frequently Asked Questions (that I mostly asked myself).

> What content types are supported

Markdown docs are rendered by the site docs framework, but other content is also include in the repo - such as importable flows or solutions. Most of the time, it makes sense to make note of the other content types in a markdown page and add a link to it, but the repo usage isn't restricted to media snippets.

> Why Markdown

A collection of scripts isn't really maintainable or easily searched. By allowing users to add descriptions or narratives to their code, they have improved utility and discoverability. IF you're not familiar with using Markdown, review the [provided markdown resources](md.md).

> Why so many files

Git is incredibly useful for managing code changes, but is typically optimized for small, incremental changes. Docs as code is a wonderful way to write and collaborate, but it can also result in a high number of conflicts when multiple users edit the same files or data.

Splitting the documents and snippets into multiple discrete files reduces these collisions - although it's still a wise choice to let other team members which docs you're working on when making big changes, and there's nothing really stopping contributors from dumping tons of resources in a single file or page.

> What framework is this site built with?

Docsify.js

> What plugins are available

Search and copy-code. Less is more.

edit-on-github was considered but it is buggy.

> Is Metadata Supported

Not *really* at this point in time. Technically, it is possible to extend the framework to support frontmatter and variables, such as using the [Mustache Plugin](https://pankajpipada.com/posts/markdown/2020-04-29-docsify-mustache/) - But that is probably overkill for the current site intentions. You can always add manual #tags below your blocks to help with discoverability and search.

> What is the difference between this site and the Synatic Community?

The biggest difference is likely publication vs engagement. Although this site is a little more dynamic in structure, it will generally a unidirectional publication workflow.

The community site is a complete forum platform designed for question and answer style engagement. Many of the existing community posts are direct responses to customer queries that simply originated on other communication channels.

Community articles also include instructional information (how to do x) rather than just descriptive information (x does y), which is the primary goal for these snippets. Community articles also focus on interface operations rather than serving as a function library for common operations.

These snippets may also include partial or work in progress collections which require constant updating and iteration to remain relevant.

In many instances there will be overlap and duplication between the two platforms anyway, but in this instance - more is more.

> Why can't I search the site with a search engine

This site parses Markdown on the fly from content available online, rather than caching it as static content and making it SEO ready. The search tool or search operations on the GitHub repo are likely to yield better results.
