# Parameters

Synatic flows allow for input parameters to be defined within flows, effectively serving as local environment variables for a flow context.

These scripts provide examples for interacting with parameters, such as setting or validating them accordingly.

## Reference

Parameters are usually accessible within the configuration form of a step. These are usually accessible with a `@` prefix, e.g.

- `@record`: The current record value
- `@inputRecord`: The current record value
- `@org-parameter-name`: A named parameter within the organization
- `input`: The current record object being processed

Within steps, the parameters may be accessed using templates, such as within strings, e.g. `'{@inputRecord.attributeValue}'`.
