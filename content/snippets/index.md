# Snippets

> Code snippets and calc step operations.

## Sections

- [Cleaning](snippets/cleaning.md)
- [Parameters](snippets/parameters.md)
- [Processing](snippets/processing.md)

- [The Bucket](snippets/bucket.md)

## General

Remember to return your record object

```javascript
let inputRecord=input.record;
return inputRecord
```

Make record blank

```javascript
let inputRecord=input.record;
inputRecord={}
return inputRecord
```

Process "passed errors" (filter example)

```javascript
if (!!input.passedError) {
    return true;
} else {
    return false;
}
```

Retrieve headers from an http destination or lookup - this must be run *directly after* the http step.

```javascript
inputRecord.headers=input.headers[0];
```

Generate uids: Use random with toString(radix/ base) and slice to generate a random string.

```javascript
// 13 chars
Math.random().toString(16).slice(2)
// 8 chars
Math.random().toString(16).slice(2).substring(0,8)
// 16 chars
Math.random().toString(16).slice(2).substring(0,8) + Math.random().toString(16).slice(2).substring(0,8)
```

For loop (You never get used to this nonsense)

```javascript
for (let i = 0; i <= 9; i++) {
  console.log(i);
}
```

## Exceptions

Throw an exception (raise an error) for the current record

```javascript
let x=0;
if (x>=1) {
    throw new APIError(400,"Keep calm and use less x")
}
```

## Utils

Built in utils and operational functions

[dayjs](https://day.js.org/)
https://community.synatic.com/t/using-dayjs-in-calculators/48

utils.hash(obj): Creates a unique string hash of the object
utils.round(num, precision): Rounds a float to the specified precision

https://community.synatic.com/t/miscellaneous-calculator-functions/64
https://community.synatic.com/t/using-utility-methods-in-calculators/185

## Helpers

Custom implementations of data manipulation tools and utility functions to address common use cases.

The stringHelper class includes functions for:

- clean
- capitalize
- count
- startsWith
- endsWith
- padLeft
- padRight
- replaceAll
- parseTemplateObject

Read the full article for more detailed examples:

https://community.synatic.com/t/string-helpers-in-calculators/63
