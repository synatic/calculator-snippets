# Processing

Data processing functions for common use cases, such as manipulating social security numbers, transforming addresses, reformatting phone numbers, and so on.

## Encodings

If you don't know your ASCII from your elbow, you may need to find a good primer:

- https://www.freecodecamp.org/news/everything-you-need-to-know-about-encoding/
- https://www.tutorialspoint.com/what-is-base64-encoding
- https://www.redhat.com/sysadmin/base64-encoding

### Byte Buffers

Process bytes and transform data between encodings

https://community.synatic.com/t/byte-buffers-in-calculators/60

## Dates

It's never quite so simple as it seems... amiright?

### One Liners

- Get date in milliseconds (unix timestamp): `utils.dayjs('2017-03-15').valueOf()`
- Get date in  ISO 8601 string format: `utils.dayjs(inputRecord.DATE).toISOString()`
- Various dayjs operations: https://community.synatic.com/t/using-dayjs-in-calculators/48

### Ordinal to date

Convert ordinal date integer, or "julian" style (a common misnomer used as a descriptor in mainframe computing and backend circles) in `YYYYDDD` format common in financial applications to a date object

```javascript
// convert ordinal "julian" style date in yyyyddd format to ISO 8601 string
let yyyy = parseInt(inputRecord.dateAttr.toString().substring(0,4));
let ddd = parseInt(inputRecord.dateAttr.toString().substring(4,7));
inputRecord.dateAttr=new Date(yyyy,0,ddd);
```

### Julian to date

Actual Julian (e.g. astronomy) day value to date object/ iso string conversion

```javascript
// convert julian date to ISO 8601
new Date((julianDate-2440587.5) * 86400000).toISOString();
```
