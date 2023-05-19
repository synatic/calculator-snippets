# Data Cleaning

iPaaS users typically need to execute on  Extract-Transform-Load (ETL) and Reverse-ETL operations. With real-world (dirty) data, this can be challenging and lead to errors or operational failure.

These scripts here are designed to help out with such data cleaning, validation, and type parsing or casting.

## Strings

Useful string functions and utilities

### Clean all record strings

Iterate all items in an object and edit them in place to clean all strings. The `clean` string helper function trims leading and trailing whitespace as well as replaces multi-spaces with a single space.

```javascript
// clean strings
Object.entries(inputRecord).forEach(([key, value]) =>  {
    if (typeof inputRecord[key] === "string" || inputRecord[key] instanceof String) {
        inputRecord[key] = stringHelper.clean(value)
    }
})
```

#clean, #string, #iterate, #object
